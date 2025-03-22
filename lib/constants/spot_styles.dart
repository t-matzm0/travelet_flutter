// lib/constants/spot_styles.dart
import 'package:flutter/material.dart';

class SpotStyles {
  // === Color ===
  static const Color likeActiveColor = Colors.blue;
  static const Color bookmarkActiveColor = Colors.orange;
  static const Color inactiveIconColor = Colors.grey;
  static const Color placeholderBackgroundColor = Color(0xFFD6D6D6);

  // === Icon ===
  static const double iconSize = 24.0;
  static const double iconSpacing = 16.0;

  // === Text ===
  static const double baseFontSize = 14.0;
  static const TextStyle countTextStyle = TextStyle(
    fontSize: baseFontSize,
    color: Colors.black87,
  );
  static const TextStyle placeholderTextStyle = TextStyle(
    color: Colors.black54,
    fontSize: 14,
  );
  static const String placeholderText = '画像なし';

  // === Padding / Margin ===
  static const double defaultPadding = 16.0;
  static const double sectionSpacing = 12.0;

  // === Border / Card ===
  static const double cardElevation = 4.0;
  static const double borderRadius = 8.0;

  // === Image ===
  static const double imageThumbnailWidth = 180.0;
  static const double detailImageHeight = 200.0;
  static const double imagePopupMaxWidthRatio = 0.85; // 画面幅に対する割合
  static const double imagePopupMaxHeightRatio = 0.85; // 画面高に対する割合

  // === Responsive Base ===
  static const double baseScreenWidth = 375.0; // iPhone 11相当

  // === Breakpoints ===
  static const double breakpointTablet = 600.0;
  static const double breakpointDesktop = 1024.0;
  static const double breakpointWide = 1200.0;

  // === Font scaling ===
  static const double tabletFontScale = 1.1;
  static const double desktopFontScale = 1.2;

  // === Max content width ===
  static const double maxContentWidthDesktop = 800.0;
  static const double maxContentWidthWide = 1000.0;
  static const double mobileContentWidthRatio = 0.95;
}
