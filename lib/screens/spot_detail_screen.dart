import 'package:flutter/material.dart';

class SpotDetailScreen extends StatelessWidget {
  final String name;
  final String address;

  SpotDetailScreen({required this.name, required this.address});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('スポット名', style: Theme.of(context).textTheme.titleMedium),
            SizedBox(height: 4),
            Text(name, style: Theme.of(context).textTheme.titleLarge),
            SizedBox(height: 16),
            Text('住所', style: Theme.of(context).textTheme.titleMedium),
            SizedBox(height: 4),
            Text(address, style: Theme.of(context).textTheme.bodyLarge),
          ],
        ),
      ),
    );
  }
}
