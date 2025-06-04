import 'package:flutter/material.dart';
import '../models/itinerary.dart';
import '../models/spot.dart';
import 'itinerary_detail_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  int _selectedTimeFilter = 30;
  String _selectedTransport = '電車';
  
  // デモ用データ
  final List<Map<String, dynamic>> _demoResults = [
    {
      'title': '浅草寺周辺散策プラン',
      'duration': 15,
      'transport': '徒歩',
      'spotCount': 3,
      'description': '浅草寺を中心に下町情緒を楽しむ',
      'image': 'https://upload.wikimedia.org/wikipedia/commons/7/75/Cloudy_Sens%C5%8D-ji.jpg',
    },
    {
      'title': 'スカイツリー観光プラン', 
      'duration': 25,
      'transport': '電車',
      'spotCount': 4,
      'description': 'スカイツリーと周辺施設を満喫',
      'image': 'https://upload.wikimedia.org/wikipedia/commons/8/84/Tokyo_Skytree_2014_%E2%85%A2.jpg',
    },
    {
      'title': '上野公園アートツアー',
      'duration': 20,
      'transport': '徒歩',
      'spotCount': 5,
      'description': '美術館・博物館を巡る文化的な一日',
      'image': 'https://upload.wikimedia.org/wikipedia/commons/6/60/Ueno_Park_in_Spring_2017.jpg',
    },
  ];

  List<Map<String, dynamic>> get _filteredResults {
    return _demoResults.where((result) {
      final matchesTime = result['duration'] <= _selectedTimeFilter;
      final matchesTransport = _selectedTransport == 'すべて' || 
                              result['transport'] == _selectedTransport;
      final matchesSearch = _searchController.text.isEmpty ||
          result['title'].toString().toLowerCase().contains(_searchController.text.toLowerCase()) ||
          result['description'].toString().toLowerCase().contains(_searchController.text.toLowerCase());
      
      return matchesTime && matchesTransport && matchesSearch;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('検索'),
        elevation: 0,
      ),
      body: Column(
        children: [
          // 検索エリア
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withOpacity(0.05),
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(16),
              ),
            ),
            child: Column(
              children: [
                // 検索バー
                TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: '場所やキーワードで検索',
                    prefixIcon: const Icon(Icons.search),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  onChanged: (_) => setState(() {}),
                ),
                const SizedBox(height: 16),
                
                // フィルターチップ
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      // 時間フィルター
                      _buildTimeFilterChip(15, '15分以内'),
                      const SizedBox(width: 8),
                      _buildTimeFilterChip(30, '30分以内'),
                      const SizedBox(width: 8),
                      _buildTimeFilterChip(60, '1時間以内'),
                      const SizedBox(width: 16),
                      
                      // 交通手段フィルター
                      _buildTransportChip('すべて', Icons.apps),
                      const SizedBox(width: 8),
                      _buildTransportChip('電車', Icons.train),
                      const SizedBox(width: 8),
                      _buildTransportChip('徒歩', Icons.directions_walk),
                    ],
                  ),
                ),
              ],
            ),
          ),
          
          // 検索結果
          Expanded(
            child: _filteredResults.isEmpty
                ? const Center(
                    child: Text(
                      '検索条件に一致するプランがありません',
                      style: TextStyle(color: Colors.grey),
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: _filteredResults.length,
                    itemBuilder: (context, index) {
                      final result = _filteredResults[index];
                      return _buildResultCard(result);
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimeFilterChip(int minutes, String label) {
    final isSelected = _selectedTimeFilter == minutes;
    return FilterChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (_) {
        setState(() => _selectedTimeFilter = minutes);
      },
      selectedColor: Theme.of(context).primaryColor.withOpacity(0.2),
    );
  }

  Widget _buildTransportChip(String transport, IconData icon) {
    final isSelected = _selectedTransport == transport;
    return FilterChip(
      avatar: Icon(icon, size: 18),
      label: Text(transport),
      selected: isSelected,
      onSelected: (_) {
        setState(() => _selectedTransport = transport);
      },
      selectedColor: Theme.of(context).primaryColor.withOpacity(0.2),
    );
  }

  Widget _buildResultCard(Map<String, dynamic> result) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('プラン詳細画面は準備中です')),
          );
        },
        borderRadius: BorderRadius.circular(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 画像
            if (result['image'] != null)
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(12),
                ),
                child: Image.network(
                  result['image'],
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                    height: 150,
                    color: Colors.grey[300],
                    child: const Icon(Icons.image, size: 50),
                  ),
                ),
              ),
            
            // コンテンツ
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          result['title'],
                          style: Theme.of(context).textTheme.titleMedium,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
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
                              _getTransportIcon(result['transport']),
                              size: 16,
                              color: Colors.teal[700],
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '${result['duration']}分',
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
                  Text(
                    result['description'],
                    style: Theme.of(context).textTheme.bodyMedium,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.place, size: 16, color: Colors.grey[600]),
                      const SizedBox(width: 4),
                      Text(
                        '${result['spotCount']}スポット',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 14,
                        ),
                      ),
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

  IconData _getTransportIcon(String transport) {
    switch (transport) {
      case '電車':
        return Icons.train;
      case '徒歩':
        return Icons.directions_walk;
      case '車':
        return Icons.directions_car;
      case 'バス':
        return Icons.directions_bus;
      default:
        return Icons.directions;
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}