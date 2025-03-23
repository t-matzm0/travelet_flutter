import 'package:flutter/material.dart';
import '../constants/spot_styles.dart';

class SpotTagBadge extends StatelessWidget {
  final String tag;

  const SpotTagBadge({super.key, required this.tag});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: SpotStyles.badgePadding,
      decoration: BoxDecoration(
        color: SpotStyles.tagBadgeColor,
        borderRadius: BorderRadius.circular(SpotStyles.borderRadius),
      ),
      child: Text(
        tag,
        style: TextStyle(
          fontSize: SpotStyles.badgeFontSize,
          fontWeight: SpotStyles.tagFontWeight,
          color: SpotStyles.tagTextColor,
        ),
      ),
    );
  }
}
