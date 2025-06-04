import 'package:flutter/material.dart';
import '../models/itinerary.dart';
import '../models/itinerary_point.dart';
import '../models/itinerary_segment.dart';
import '../models/transport_mode.dart';
import '../models/spot.dart';
import 'spot_select_screen.dart';

class PlanCreateScreen extends StatefulWidget {
  final List<Spot> availableSpots;

  const PlanCreateScreen({
    super.key,
    required this.availableSpots,
  });

  @override
  State<PlanCreateScreen> createState() => _PlanCreateScreenState();
}

class _PlanCreateScreenState extends State<PlanCreateScreen> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final List<ItineraryPoint> _points = [];
  final List<ItinerarySegment> _segments = [];
  final List<String> _tags = [];
  String _tagInput = '';

  void _addSpot() async {
    final selectedSpot = await Navigator.push<Spot>(
      context,
      MaterialPageRoute(
        builder: (_) => SpotSelectScreen(
          availableSpots: widget.availableSpots,
          selectedSpots: _points.map((p) => p.spot).toList(),
        ),
      ),
    );

    if (selectedSpot != null) {
      setState(() {
        // スポットを追加
        _points.add(ItineraryPoint(spot: selectedSpot));
        
        // 移動手段を追加（最初以外）
        if (_points.length > 1) {
          _segments.add(
            const ItinerarySegment(
              mode: TransportMode.train,
              durationMinutes: 30,
            ),
          );
        }
      });
    }
  }

  void _removeSpot(int index) {
    setState(() {
      _points.removeAt(index);
      // セグメントも調整
      if (index > 0 && _segments.isNotEmpty) {
        _segments.removeAt(index - 1);
      } else if (_segments.isNotEmpty) {
        _segments.removeAt(0);
      }
    });
  }

  void _reorderSpots(int oldIndex, int newIndex) {
    setState(() {
      if (newIndex > oldIndex) {
        newIndex -= 1;
      }
      final item = _points.removeAt(oldIndex);
      _points.insert(newIndex, item);
    });
  }

  void _changeTransportMode(int segmentIndex, TransportMode mode) {
    setState(() {
      _segments[segmentIndex] = _segments[segmentIndex].copyWith(mode: mode);
    });
  }

  void _toggleHotel(int index) {
    setState(() {
      _points[index] = ItineraryPoint(
        spot: _points[index].spot,
        isHotel: !_points[index].isHotel,
      );
    });
  }

  void _addTag() {
    if (_tagInput.trim().isNotEmpty && !_tags.contains(_tagInput.trim())) {
      setState(() {
        _tags.add(_tagInput.trim());
        _tagInput = '';
      });
    }
  }

  void _saveItinerary() {
    if (_titleController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('タイトルを入力してください')),
      );
      return;
    }

    if (_points.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('スポットを追加してください')),
      );
      return;
    }

    final newItinerary = Itinerary(
      title: _titleController.text,
      description: _descriptionController.text,
      points: _points,
      segments: _segments,
      tags: _tags,
      isPublic: false,
    );

    Navigator.pop(context, newItinerary);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('プランを作成'),
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
        actions: [
          TextButton(
            onPressed: _saveItinerary,
            child: const Text(
              '保存',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 基本情報入力
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: _titleController,
                    decoration: const InputDecoration(
                      labelText: 'プランのタイトル *',
                      hintText: '例：東京日帰り観光プラン',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _descriptionController,
                    maxLines: 3,
                    decoration: const InputDecoration(
                      labelText: '説明',
                      hintText: 'プランの説明を入力',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  
                  // タグ入力
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: const InputDecoration(
                            labelText: 'タグ',
                            hintText: '例：日帰り、観光、東京',
                            border: OutlineInputBorder(),
                          ),
                          onChanged: (value) => _tagInput = value,
                          onSubmitted: (_) => _addTag(),
                        ),
                      ),
                      const SizedBox(width: 8),
                      IconButton(
                        icon: const Icon(Icons.add_circle),
                        color: Theme.of(context).primaryColor,
                        iconSize: 32,
                        onPressed: _addTag,
                      ),
                    ],
                  ),
                  if (_tags.isNotEmpty) ...[
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      children: _tags.map((tag) {
                        return Chip(
                          label: Text(tag),
                          deleteIcon: const Icon(Icons.close, size: 18),
                          onDeleted: () {
                            setState(() => _tags.remove(tag));
                          },
                        );
                      }).toList(),
                    ),
                  ],
                ],
              ),
            ),
            
            // スポット一覧
            Container(
              margin: const EdgeInsets.only(top: 8),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'スポット',
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '${_points.length}件',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  ),
                  
                  if (_points.isEmpty)
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(32),
                        child: Column(
                          children: [
                            Icon(
                              Icons.add_location_alt,
                              size: 64,
                              color: Colors.grey[300],
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'スポットを追加してください',
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  else
                    ReorderableListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: _points.length,
                      onReorder: _reorderSpots,
                      itemBuilder: (context, index) {
                        final point = _points[index];
                        final spot = point.spot;
                        
                        return Card(
                          key: ValueKey(spot.id),
                          margin: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 4,
                          ),
                          child: Column(
                            children: [
                              ListTile(
                                leading: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.drag_indicator,
                                      color: Colors.grey[400],
                                    ),
                                    const SizedBox(width: 8),
                                    Container(
                                      width: 48,
                                      height: 48,
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
                                                    const Icon(Icons.place),
                                              ),
                                            )
                                          : const Icon(Icons.place),
                                    ),
                                  ],
                                ),
                                title: Text(
                                  spot.name,
                                  style: const TextStyle(fontWeight: FontWeight.bold),
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(spot.address),
                                    if (spot.stayDurationMinutes != null)
                                      Text(
                                        '滞在時間：${spot.stayDurationMinutes}分',
                                        style: TextStyle(
                                          color: Colors.grey[600],
                                          fontSize: 12,
                                        ),
                                      ),
                                  ],
                                ),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      icon: Icon(
                                        point.isHotel ? Icons.hotel : Icons.hotel_outlined,
                                        color: point.isHotel ? Colors.indigo : Colors.grey,
                                      ),
                                      onPressed: () => _toggleHotel(index),
                                      tooltip: '宿泊地に設定',
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.delete_outline),
                                      color: Colors.red,
                                      onPressed: () => _removeSpot(index),
                                    ),
                                  ],
                                ),
                              ),
                              
                              // 交通手段選択（最後のスポット以外）
                              if (index < _points.length - 1) ...[
                                const Divider(height: 1),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 8,
                                  ),
                                  color: Colors.grey[50],
                                  child: Row(
                                    children: [
                                      const Icon(Icons.arrow_downward, size: 16),
                                      const SizedBox(width: 8),
                                      const Text('移動手段：'),
                                      const SizedBox(width: 8),
                                      ..._buildTransportChips(index),
                                    ],
                                  ),
                                ),
                              ],
                            ],
                          ),
                        );
                      },
                    ),
                  
                  // スポット追加ボタン
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        onPressed: _addSpot,
                        icon: const Icon(Icons.add),
                        label: const Text('スポットを追加'),
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.all(16),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            // 概要
            if (_points.isNotEmpty)
              Container(
                margin: const EdgeInsets.only(top: 8),
                padding: const EdgeInsets.all(16),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '概要',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.place, size: 20, color: Colors.grey[600]),
                        const SizedBox(width: 4),
                        Text('${_points.length}スポット'),
                        const SizedBox(width: 16),
                        Icon(Icons.hotel, size: 20, color: Colors.grey[600]),
                        const SizedBox(width: 4),
                        Text('${_points.where((p) => p.isHotel).length}泊'),
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

  List<Widget> _buildTransportChips(int segmentIndex) {
    if (segmentIndex >= _segments.length) return [];
    
    final segment = _segments[segmentIndex];
    return TransportMode.values.map((mode) {
      final isSelected = segment.mode == mode;
      return Padding(
        padding: const EdgeInsets.only(right: 8),
        child: ChoiceChip(
          label: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                _getTransportIcon(mode),
                size: 16,
                color: isSelected ? Colors.white : Colors.grey[700],
              ),
              const SizedBox(width: 4),
              Text(_getTransportLabel(mode)),
            ],
          ),
          selected: isSelected,
          onSelected: (_) => _changeTransportMode(segmentIndex, mode),
          selectedColor: Theme.of(context).primaryColor,
        ),
      );
    }).toList();
  }

  IconData _getTransportIcon(TransportMode mode) {
    switch (mode) {
      case TransportMode.walk:
        return Icons.directions_walk;
      case TransportMode.car:
        return Icons.directions_car;
      case TransportMode.train:
        return Icons.train;
      case TransportMode.bus:
        return Icons.directions_bus;
      case TransportMode.ferry:
        return Icons.directions_boat;
      case TransportMode.bicycle:
        return Icons.directions_bike;
    }
  }

  String _getTransportLabel(TransportMode mode) {
    switch (mode) {
      case TransportMode.walk:
        return '徒歩';
      case TransportMode.car:
        return '車';
      case TransportMode.train:
        return '電車';
      case TransportMode.bus:
        return 'バス';
      case TransportMode.ferry:
        return 'フェリー';
      case TransportMode.bicycle:
        return '自転車';
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
}