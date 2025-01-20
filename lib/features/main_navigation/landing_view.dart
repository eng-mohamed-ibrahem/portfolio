import 'package:flutter/material.dart';
import 'package:portfolio/core/shared_widgets/responsive_layout.dart';
import 'package:portfolio/widgets/landing_view_desktop_layout.dart';
import 'package:portfolio/widgets/landing_view_mobile_layout.dart';

class LandingView extends StatelessWidget {
  const LandingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveLayout(
        mobileLayout: (_) => const LandingViewMobileLayout(),
        tabletLayout: (_) => const LandingViewDesktopLayout(
          tabletProjectAspectRatio: 1 / 2,
          tabletApproachGridCrossAxisCount: 2,
        ),
        desktopLayout: (_) => const LandingViewDesktopLayout(),
      ),
    );
  }
}
