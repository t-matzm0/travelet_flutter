// lib/components/spot_category_badge.dart
import 'package:flutter/material.dart';
import '../constants/spot_styles.dart';

class SpotCategoryBadge extends StatelessWidget {
  final String category;

  const SpotCategoryBadge({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.teal.shade100,
        borderRadius: BorderRadius.circular(SpotStyles.borderRadius),
      ),
      child: Text(
        category,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: Colors.teal,
        ),
      ),
    );
  }
}
