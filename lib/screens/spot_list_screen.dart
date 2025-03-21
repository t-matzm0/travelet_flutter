import 'package:flutter/material.dart';

class SpotListScreen extends StatelessWidget {
  final List<Map<String, String>> spots = [
    {'name': '浅草寺', 'address': '東京都台東区浅草'},
    {'name': '東京スカイツリー', 'address': '東京都墨田区押上'},
    {'name': '銀座', 'address': '東京都中央区銀座'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('スポット一覧')),
      body: ListView.builder(
        itemCount: spots.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(spots[index]['name']!),
            subtitle: Text(spots[index]['address']!),
          );
        },
      ),
    );
  }
}
