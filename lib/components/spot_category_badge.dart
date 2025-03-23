import 'package:flutter/material.dart';
import '../constants/spot_styles.dart';

class SpotCategoryBadge extends StatelessWidget {
  final String category;

  const SpotCategoryBadge({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: SpotStyles.badgePadding,
      decoration: BoxDecoration(
        color: SpotStyles.categoryBadgeColor,
        borderRadius: BorderRadius.circular(SpotStyles.borderRadius),
      ),
      child: Text(
        category,
        style: TextStyle(
          fontSize: SpotStyles.badgeFontSize,
          fontWeight: SpotStyles.categoryFontWeight,
          color: SpotStyles.categoryTextColor,
        ),
      ),
    );
  }
}
