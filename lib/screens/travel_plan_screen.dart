import 'package:flutter/material.dart';

class TravelPlanScreen extends StatelessWidget {
  const TravelPlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('旅行プラン')),
      body: Center(child: Text('旅行プラン作成画面')),
    );
  }
}
