import 'package:flutter/material.dart';
import 'spot_list_screen.dart';
import 'spot_form_screen.dart';
import '../models/spot.dart';

class HomeScreen extends StatefulWidget {
  final List<Spot> spots;

  const HomeScreen({super.key, required this.spots});

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          SpotListScreen(spots: _spots),
          const Center(child: Text('リスト作成（仮）')),
          const Center(child: Text('旅程作成（仮）')),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.place), label: 'スポット'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'リスト'),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: '旅程',
          ),
        ],
      ),
      floatingActionButton:
          _selectedIndex == 0
              ? FloatingActionButton(
                onPressed: _navigateToAddSpot,
                tooltip: 'スポットを追加',
                child: const Icon(Icons.add),
              )
              : null,
    );
  }
}
