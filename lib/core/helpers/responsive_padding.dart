import 'package:flutter/material.dart';

/// Responsive padding helper that adapts to screen size
class ResponsivePadding {
  ResponsivePadding._();

  /// Get horizontal padding based on screen width
  static double horizontal(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < 600) {
      return 16.0; // Mobile
    } else if (width < 768) {
      return 24.0; // Small tablet
    } else if (width < 1024) {
      return 40.0; // Large tablet
    } else if (width < 1440) {
      return 64.0; // Desktop
    } else if (width < 1920) {
      return 96.0; // Large Desktop
    } else {
      return 128.0; // Ultra-wide
    }
  }

  /// Get vertical padding based on screen height
  static double vertical(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    if (height < 700) {
      return 16.0; // Small screens
    } else if (height < 900) {
      return 24.0; // Medium screens
    } else if (height < 1080) {
      return 32.0; // Large screens
    } else {
      return 40.0; // Extra large screens
    }
  }

  /// Get section spacing based on screen width
  static double section(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < 600) {
      return 48.0; // Mobile
    } else if (width < 768) {
      return 64.0; // Small tablet
    } else if (width < 1024) {
      return 96.0; // Large tablet
    } else {
      return 120.0; // Desktop and above
    }
  }

  /// Get card padding based on screen width
  static double card(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < 600) {
      return 16.0; // Mobile
    } else if (width < 768) {
      return 20.0; // Small tablet
    } else if (width < 1024) {
      return 28.0; // Large tablet
    } else {
      return 32.0; // Desktop
    }
  }

  /// Get all-around padding
  static EdgeInsets all(BuildContext context) {
    return EdgeInsets.all(horizontal(context));
  }

  /// Get symmetric horizontal padding
  static EdgeInsets symmetric(BuildContext context) {
    return EdgeInsets.symmetric(horizontal: horizontal(context));
  }

  /// Get symmetric padding with vertical
  static EdgeInsets symmetricBoth(BuildContext context) {
    return EdgeInsets.symmetric(
      horizontal: horizontal(context),
      vertical: vertical(context),
    );
  }
}

/// Responsive sizing helper
class ResponsiveSize {
  ResponsiveSize._();

  /// Get responsive icon size
  static double icon(BuildContext context, {double base = 24.0}) {
    final width = MediaQuery.of(context).size.width;
    if (width < 600) {
      return base * 0.8; // Mobile
    } else if (width < 768) {
      return base * 0.9; // Small tablet
    } else if (width < 1024) {
      return base; // Large tablet
    } else {
      return base * 1.2; // Desktop
    }
  }

  /// Get responsive button height
  static double buttonHeight(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < 600) {
      return 48.0; // Mobile
    } else if (width < 768) {
      return 50.0; // Small tablet
    } else if (width < 1024) {
      return 54.0; // Large tablet
    } else {
      return 56.0; // Desktop
    }
  }

  /// Get responsive border radius
  static double borderRadius(BuildContext context, {double base = 16.0}) {
    final width = MediaQuery.of(context).size.width;
    if (width < 600) {
      return base * 0.75; // Mobile
    } else if (width < 768) {
      return base * 0.875; // Small tablet
    } else {
      return base; // Large tablet and above
    }
  }

  /// Get max content width for centering
  static double maxContentWidth(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < 600) {
      return width; // Full width on mobile
    } else if (width < 768) {
      return 700.0; // Small tablet
    } else if (width < 1024) {
      return 900.0; // Large tablet
    } else if (width < 1440) {
      return 1200.0; // Desktop
    } else {
      return 1400.0; // Large screens
    }
  }

  /// Get responsive grid cross axis count
  static int gridCrossAxisCount(
    BuildContext context, {
    int mobile = 1,
    int smallTablet = 2,
    int largeTablet = 2,
    int desktop = 3,
  }) {
    final width = MediaQuery.of(context).size.width;
    if (width < 600) {
      return mobile; // Mobile
    } else if (width < 768) {
      return smallTablet; // Small tablet
    } else if (width < 1024) {
      return largeTablet; // Large tablet
    } else {
      return desktop; // Desktop
    }
  }

  /// Get responsive grid main axis extent
  static double gridMainAxisExtent(
    BuildContext context, {
    double mobile = 400.0,
    double smallTablet = 400.0,
    double largeTablet = 400.0,
    double desktop = 400.0,
  }) {
    final width = MediaQuery.of(context).size.width;
    if (width < 600) {
      return mobile; // Mobile
    } else if (width < 768) {
      return smallTablet; // Small tablet
    } else if (width < 1024) {
      return largeTablet; // Large tablet
    } else {
      return desktop; // Desktop
    }
  }

  /// Get responsive spacing between elements
  static double spacing(BuildContext context, {double base = 16.0}) {
    final width = MediaQuery.of(context).size.width;
    if (width < 600) {
      return base * 0.75; // Mobile
    } else if (width < 768) {
      return base * 0.875; // Small tablet
    } else if (width < 1024) {
      return base; // Large tablet
    } else {
      return base * 1.25; // Desktop
    }
  }
}
