import 'package:flutter/material.dart';
import 'spot_list_screen.dart';
import 'travel_plan_screen.dart';
import 'spot_register_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    SpotListScreen(),
    TravelPlanScreen(),
    SpotRegisterScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.place), label: 'スポット'),
          BottomNavigationBarItem(icon: Icon(Icons.map), label: '旅行プラン'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: '追加'),
        ],
      ),
    );
  }
}
