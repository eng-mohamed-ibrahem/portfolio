import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/size_config.dart';

extension MediaQueryExtension on BuildContext {
  double get screenHeight => MediaQuery.sizeOf(this).height;
  double get screenWidth => MediaQuery.sizeOf(this).width;

  bool get isMobile => screenWidth < SizeConfig.mobileBreakPoint;
  bool get isTablet =>
      screenWidth >= SizeConfig.mobileBreakPoint &&
      screenWidth < SizeConfig.tabletBreakPoint;
  bool get isDesktop => screenWidth >= SizeConfig.tabletBreakPoint;
}
