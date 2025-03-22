// lib/components/spot_image.dart
import 'package:flutter/material.dart';
import '../constants/spot_styles.dart';

class SpotImage extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double height;
  final double borderRadius;
  final BoxFit fit;

  const SpotImage({
    super.key,
    required this.imageUrl,
    required this.width,
    required this.height,
    this.borderRadius = SpotStyles.borderRadius,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Image.network(
        imageUrl,
        width: width,
        height: height,
        fit: fit,
        errorBuilder:
            (_, __, ___) => Container(
              width: width,
              height: height,
              color: SpotStyles.placeholderBackgroundColor,
              child: const Center(
                child: Text(
                  SpotStyles.placeholderText,
                  style: SpotStyles.placeholderTextStyle,
                ),
              ),
            ),
      ),
    );
  }
}
