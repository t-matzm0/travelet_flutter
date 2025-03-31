import 'package:flutter/material.dart';
import '../constants/spot_styles.dart';
import '../constants/ui_texts.dart';

class OptimizedNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;
  final BorderRadius borderRadius;
  final bool usePlaceholder;

  const OptimizedNetworkImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.borderRadius = BorderRadius.zero,
    this.usePlaceholder = true,
  });

  @override
  Widget build(BuildContext context) {
    final hasImage = imageUrl.trim().isNotEmpty;

    return ClipRRect(
      borderRadius: borderRadius,
      child:
          hasImage
              ? Image.network(
                imageUrl,
                width: width,
                height: height,
                fit: fit,
                errorBuilder: (_, __, ___) => _buildPlaceholder(),
                loadingBuilder: (context, child, progress) {
                  if (progress == null) return child;
                  return _buildLoading();
                },
              )
              : _buildPlaceholder(),
    );
  }

  Widget _buildPlaceholder() {
    return Container(
      width: width,
      height: height,
      color: SpotStyles.placeholderBackgroundColor,
      child: Center(
        child: Text(UITexts.noImage, style: SpotStyles.placeholderTextStyle),
      ),
    );
  }

  Widget _buildLoading() {
    return Container(
      width: width,
      height: height,
      color: SpotStyles.placeholderBackgroundColor,
      child: const Center(child: CircularProgressIndicator(strokeWidth: 2)),
    );
  }
}
