import 'package:flutter/material.dart';
import '../models/spot.dart';

class SpotSelectScreen extends StatefulWidget {
  final List<Spot> availableSpots;
  final List<Spot> selectedSpots;

  const SpotSelectScreen({
    super.key,
    required this.availableSpots,
    required this.selectedSpots,
  });

  @override
  State<SpotSelectScreen> createState() => _SpotSelectScreenState();
}

class _SpotSelectScreenState extends State<SpotSelectScreen> {
  final _searchController = TextEditingController();
  String _selectedCategory = 'すべて';
  List<String> _categories = ['すべて'];

  @override
  void initState() {
    super.initState();
    // カテゴリーリストを作成
    final categories = widget.availableSpots
        .map((spot) => spot.category)
        .toSet()
        .toList();
    _categories = ['すべて', ...categories];
  }

  List<Spot> get _filteredSpots {
    return widget.availableSpots.where((spot) {
      // 既に選択されているスポットは除外
      if (widget.selectedSpots.contains(spot)) {
        return false;
      }

      // カテゴリーフィルター
      if (_selectedCategory != 'すべて' && spot.category != _selectedCategory) {
        return false;
      }

      // 検索フィルター
      if (_searchController.text.isNotEmpty) {
        final query = _searchController.text.toLowerCase();
        return spot.name.toLowerCase().contains(query) ||
               spot.address.toLowerCase().contains(query) ||
               spot.tags.any((tag) => tag.toLowerCase().contains(query));
      }

      return true;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('スポットを選択'),
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          // 検索バー
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'スポット名や住所で検索',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                  ),
                  onChanged: (_) => setState(() {}),
                ),
                const SizedBox(height: 12),
                
                // カテゴリーフィルター
                SizedBox(
                  height: 40,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _categories.length,
                    itemBuilder: (context, index) {
                      final category = _categories[index];
                      final isSelected = _selectedCategory == category;
                      
                      return Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: FilterChip(
                          label: Text(category),
                          selected: isSelected,
                          onSelected: (_) {
                            setState(() => _selectedCategory = category);
                          },
                          selectedColor: Theme.of(context).primaryColor.withValues(alpha: 0.2),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          
          // スポット一覧
          Expanded(
            child: _filteredSpots.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.search_off,
                          size: 64,
                          color: Colors.grey[300],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          '該当するスポットがありません',
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: _filteredSpots.length,
                    itemBuilder: (context, index) {
                      final spot = _filteredSpots[index];
                      
                      return Card(
                        margin: const EdgeInsets.only(bottom: 12),
                        child: InkWell(
                          onTap: () => Navigator.pop(context, spot),
                          borderRadius: BorderRadius.circular(12),
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Row(
                              children: [
                                // 画像
                                Container(
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: spot.photos.isNotEmpty
                                      ? ClipRRect(
                                          borderRadius: BorderRadius.circular(8),
                                          child: Image.network(
                                            spot.photos.first,
                                            fit: BoxFit.cover,
                                            errorBuilder: (_, __, ___) =>
                                                const Icon(
                                                  Icons.place,
                                                  size: 40,
                                                  color: Colors.grey,
                                                ),
                                          ),
                                        )
                                      : const Icon(
                                          Icons.place,
                                          size: 40,
                                          color: Colors.grey,
                                        ),
                                ),
                                const SizedBox(width: 12),
                                
                                // 情報
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        spot.name,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        spot.address,
                                        style: TextStyle(
                                          color: Colors.grey[600],
                                          fontSize: 14,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(height: 8),
                                      Row(
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 8,
                                              vertical: 4,
                                            ),
                                            decoration: BoxDecoration(
                                              color: Colors.teal[50],
                                              borderRadius: BorderRadius.circular(4),
                                            ),
                                            child: Text(
                                              spot.category,
                                              style: TextStyle(
                                                color: Colors.teal[700],
                                                fontSize: 12,
                                              ),
                                            ),
                                          ),
                                          if (spot.stayDurationMinutes != null) ...[
                                            const SizedBox(width: 8),
                                            Icon(
                                              Icons.schedule,
                                              size: 16,
                                              color: Colors.grey[600],
                                            ),
                                            const SizedBox(width: 4),
                                            Text(
                                              '${spot.stayDurationMinutes}分',
                                              style: TextStyle(
                                                color: Colors.grey[600],
                                                fontSize: 12,
                                              ),
                                            ),
                                          ],
                                        ],
                                      ),
                                      if (spot.tags.isNotEmpty) ...[
                                        const SizedBox(height: 4),
                                        Wrap(
                                          spacing: 4,
                                          children: spot.tags.take(3).map((tag) {
                                            return Text(
                                              '#$tag',
                                              style: TextStyle(
                                                color: Colors.grey[600],
                                                fontSize: 12,
                                              ),
                                            );
                                          }).toList(),
                                        ),
                                      ],
                                    ],
                                  ),
                                ),
                                
                                // 選択アイコン
                                Icon(
                                  Icons.add_circle_outline,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}