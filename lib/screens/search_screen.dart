import 'package:flutter/material.dart';
import '../models/itinerary.dart';
import '../models/transport_mode.dart';
import '../extensions/transport_mode_extension.dart';
import 'itinerary_detail_screen.dart';
import '../components/optimized_network_image.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _searchController = TextEditingController();
  int _maxTravelTime = 30; // 分
  TransportMode _selectedTransportMode = TransportMode.train;
  bool _useCurrentLocation = true;

  // TODO: 実際はFirebaseから取得
  final List<Itinerary> _allItineraries = [];

  List<Itinerary> get _filteredItineraries {
    return _allItineraries.where((itinerary) {
      // キーワード検索
      if (_searchController.text.isNotEmpty) {
        final query = _searchController.text.toLowerCase();
        final matchesQuery =
            itinerary.title.toLowerCase().contains(query) ||
            itinerary.description.toLowerCase().contains(query) ||
            itinerary.tags.any((tag) => tag.toLowerCase().contains(query)) ||
            itinerary.points.any(
              (point) =>
                  point.spot.name.toLowerCase().contains(query) ||
                  point.spot.address.toLowerCase().contains(query),
            );

        if (!matchesQuery) return false;
      }

      // TODO: 実際の所要時間計算
      // 現在は仮の実装
      final estimatedTime = _calculateEstimatedTime(itinerary);
      return estimatedTime <= _maxTravelTime;
    }).toList();
  }

  // 仮の所要時間計算
  int _calculateEstimatedTime(Itinerary itinerary) {
    // TODO: Google Maps APIを使った実際の計算
    switch (_selectedTransportMode) {
      case TransportMode.walk:
        return 60;
      case TransportMode.bicycle:
        return 40;
      case TransportMode.car:
        return 20;
      case TransportMode.train:
        return 30;
      case TransportMode.bus:
        return 35;
      case TransportMode.ferry:
        return 50;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: CustomScrollView(
        slivers: [
          // 検索ヘッダー
          SliverAppBar(
            expandedHeight: 280,
            floating: false,
            pinned: true,
            backgroundColor: Theme.of(context).primaryColor,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Theme.of(context).primaryColor,
                      Theme.of(context).primaryColor.withBlue(200),
                    ],
                  ),
                ),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 40),
                        const Text(
                          '今から行ける場所を探す',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),

                        // 検索バー
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: TextField(
                            controller: _searchController,
                            decoration: const InputDecoration(
                              hintText: 'エリア、スポット名、キーワード',
                              prefixIcon: Icon(Icons.search),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 15,
                              ),
                            ),
                            onChanged: (_) => setState(() {}),
                          ),
                        ),
                        const SizedBox(height: 16),

                        // フィルターチップ
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: [
                            // 所要時間
                            FilterChip(
                              label: Text('$_maxTravelTime分以内'),
                              onSelected: (_) => _showTimeDialog(),
                              selected: true,
                              backgroundColor: Colors.white.withOpacity(0.9),
                              selectedColor: Colors.white,
                              checkmarkColor: Theme.of(context).primaryColor,
                            ),

                            // 交通手段
                            FilterChip(
                              label: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(_selectedTransportMode.icon, size: 16),
                                  const SizedBox(width: 4),
                                  Text(_selectedTransportMode.label),
                                ],
                              ),
                              onSelected: (_) => _showTransportDialog(),
                              selected: true,
                              backgroundColor: Colors.white.withOpacity(0.9),
                              selectedColor: Colors.white,
                              checkmarkColor: Theme.of(context).primaryColor,
                            ),

                            // 現在地から
                            FilterChip(
                              label: const Text('現在地から'),
                              selected: _useCurrentLocation,
                              onSelected: (value) {
                                setState(() => _useCurrentLocation = value);
                              },
                              backgroundColor: Colors.white.withOpacity(0.9),
                              selectedColor: Colors.white,
                              checkmarkColor: Theme.of(context).primaryColor,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

          // 検索結果
          if (_filteredItineraries.isEmpty)
            const SliverFillRemaining(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.search_off, size: 64, color: Colors.grey),
                    SizedBox(height: 16),
                    Text(
                      '条件に合うプランが見つかりません',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            )
          else
            SliverPadding(
              padding: const EdgeInsets.all(16),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  final itinerary = _filteredItineraries[index];
                  return _SearchResultCard(
                    itinerary: itinerary,
                    estimatedTime: _calculateEstimatedTime(itinerary),
                    transportMode: _selectedTransportMode,
                  );
                }, childCount: _filteredItineraries.length),
              ),
            ),
        ],
      ),
    );
  }

  void _showTimeDialog() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                '移動時間の上限',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              ...[15, 30, 45, 60, 90, 120].map((minutes) {
                return ListTile(
                  title: Text('$minutes分以内'),
                  leading: Radio<int>(
                    value: minutes,
                    groupValue: _maxTravelTime,
                    onChanged: (value) {
                      setState(() => _maxTravelTime = value!);
                      Navigator.pop(context);
                    },
                  ),
                );
              }),
            ],
          ),
        );
      },
    );
  }

  void _showTransportDialog() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                '交通手段',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              ...TransportMode.values.map((mode) {
                return ListTile(
                  title: Text(mode.label),
                  leading: Icon(mode.icon),
                  trailing: Radio<TransportMode>(
                    value: mode,
                    groupValue: _selectedTransportMode,
                    onChanged: (value) {
                      setState(() => _selectedTransportMode = value!);
                      Navigator.pop(context);
                    },
                  ),
                );
              }),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}

class _SearchResultCard extends StatelessWidget {
  final Itinerary itinerary;
  final int estimatedTime;
  final TransportMode transportMode;

  const _SearchResultCard({
    required this.itinerary,
    required this.estimatedTime,
    required this.transportMode,
  });

  @override
  Widget build(BuildContext context) {
    final spotNames = itinerary.points.map((p) => p.spot.name).toList();
    final representativeImage =
        itinerary.representativeImageUrl ??
        (itinerary.points.isNotEmpty &&
                itinerary.points.first.spot.photos.isNotEmpty
            ? itinerary.points.first.spot.photos.first
            : null);

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ItineraryDetailScreen(itinerary: itinerary),
            ),
          );
        },
        borderRadius: BorderRadius.circular(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 画像
            if (representativeImage != null)
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(12),
                ),
                child: OptimizedNetworkImage(
                  imageUrl: representativeImage,
                  height: 160,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // タイトルと所要時間
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          itinerary.title.isNotEmpty
                              ? itinerary.title
                              : 'タイトル未設定',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.teal[50],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              transportMode.icon,
                              size: 16,
                              color: Colors.teal[700],
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '約$estimatedTime分',
                              style: TextStyle(
                                color: Colors.teal[700],
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),

                  // スポット名
                  Text(
                    spotNames.join(' → '),
                    style: TextStyle(color: Colors.grey[600], fontSize: 14),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 12),

                  // タグとスポット数
                  Row(
                    children: [
                      Icon(Icons.place, size: 16, color: Colors.grey[600]),
                      const SizedBox(width: 4),
                      Text(
                        '${itinerary.points.length}スポット',
                        style: TextStyle(color: Colors.grey[600], fontSize: 14),
                      ),
                      const SizedBox(width: 16),
                      if (itinerary.tags.isNotEmpty) ...[
                        Expanded(
                          child: Text(
                            itinerary.tags.map((tag) => '#$tag').join(' '),
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 14,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
