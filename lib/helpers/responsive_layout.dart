// lib/helpers/responsive_layout.dart
import 'package:flutter/material.dart';
import '../constants/spot_styles.dart';

class ResponsiveLayout {
  static bool isMobile(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width < SpotStyles.breakpointTablet;
  }

  static bool isTablet(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width >= SpotStyles.breakpointTablet &&
        width < SpotStyles.breakpointDesktop;
  }

  static bool isDesktop(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width >= SpotStyles.breakpointDesktop;
  }

  static bool isPortrait(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return size.height > size.width;
  }

  static double responsiveFontSize(BuildContext context, double baseFontSize) {
    final width = MediaQuery.of(context).size.width;
    if (width >= SpotStyles.breakpointDesktop) {
      return baseFontSize * SpotStyles.desktopFontScale;
    }
    if (width >= SpotStyles.breakpointTablet) {
      return baseFontSize * SpotStyles.tabletFontScale;
    }
    return baseFontSize;
  }

  static double maxContentWidth(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width >= SpotStyles.breakpointWide) {
      return SpotStyles.maxContentWidthWide;
    }
    if (width >= SpotStyles.breakpointDesktop) {
      return SpotStyles.maxContentWidthDesktop;
    }
    return width * SpotStyles.mobileContentWidthRatio;
  }

  static bool isWide(BuildContext context) {
    return MediaQuery.of(context).size.width >= 600;
  }
}
