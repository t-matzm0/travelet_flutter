import 'package:flutter/material.dart';
import 'spot_list_screen.dart';
import 'spot_form_screen.dart';
import 'itinerary_list_screen.dart';
import '../models/spot.dart';
import '../models/itinerary.dart';

class HomeScreen extends StatefulWidget {
  final List<Spot> spots;
  final List<Itinerary> itineraries;

  const HomeScreen({super.key, required this.spots, required this.itineraries});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  late List<Spot> _spots;

  @override
  void initState() {
    super.initState();
    _spots = List.from(widget.spots);
  }

  Future<void> _navigateToAddSpot() async {
    final newSpot = await Navigator.push<Spot>(
      context,
      MaterialPageRoute(builder: (_) => const SpotFormScreen()),
    );

    if (newSpot != null) {
      setState(() {
        _spots.insert(0, newSpot);
      });
    }
  }

  late final List<_TabItem> _tabItems = [
    _TabItem(
      label: '旅程',
      icon: Icons.calendar_today,
      body: ItineraryListScreen(itineraries: widget.itineraries),
    ),
    _TabItem(
      label: 'スポット',
      icon: Icons.place,
      body: SpotListScreen(spots: _spots),
      fab: FloatingActionButton(
        onPressed: _navigateToAddSpot,
        tooltip: 'スポットを追加',
        child: const Icon(Icons.add),
      ),
    ),
    // _TabItem(
    //   label: 'リスト',
    //   icon: Icons.list,
    //   body: const Center(child: Text('リスト作成（仮）')),
    // ),
  ];

  @override
  Widget build(BuildContext context) {
    final currentTab = _tabItems[_selectedIndex];
    return Scaffold(
      body: currentTab.body,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        items:
            _tabItems
                .map(
                  (tab) => BottomNavigationBarItem(
                    icon: Icon(tab.icon),
                    label: tab.label,
                  ),
                )
                .toList(),
      ),
      floatingActionButton: currentTab.fab,
    );
  }
}

class _TabItem {
  final String label;
  final IconData icon;
  final Widget body;
  final Widget? fab;

  _TabItem({
    required this.label,
    required this.icon,
    required this.body,
    this.fab,
  });
}
