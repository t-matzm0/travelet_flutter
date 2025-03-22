// lib/components/spot_tag_badge.dart
import 'package:flutter/material.dart';
import '../constants/spot_styles.dart';

class SpotTagBadge extends StatelessWidget {
  final String tag;

  const SpotTagBadge({super.key, required this.tag});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(SpotStyles.borderRadius),
      ),
      child: Text(
        tag,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: Colors.black87,
        ),
      ),
    );
  }
}
