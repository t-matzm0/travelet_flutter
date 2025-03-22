// lib/screens/home_screen.dart
import 'package:flutter/material.dart';
import 'spot_list_screen.dart';
import '../models/spot.dart';

class HomeScreen extends StatefulWidget {
  final List<Spot> spots;

  const HomeScreen({super.key, required this.spots});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          SpotListScreen(spots: widget.spots),
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
    );
  }
}
