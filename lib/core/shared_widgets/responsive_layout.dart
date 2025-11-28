import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/size_config.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({
    super.key,
    required this.mobileLayout,
    required this.tabletLayout,
    required this.desktopLayout,
  });

  // Use WidgetBuilder to avoid building / creating the widget when it is not needed
  final WidgetBuilder mobileLayout;
  final WidgetBuilder tabletLayout;
  final WidgetBuilder desktopLayout;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Determine which layout to show
        Widget currentLayout;
        if (constraints.maxWidth > SizeConfig.tabletBreakPoint) {
          currentLayout = desktopLayout(context);
        } else if (constraints.maxWidth > SizeConfig.mobileBreakPoint) {
          currentLayout = tabletLayout(context);
        } else {
          currentLayout = mobileLayout(context);
        }

        // Wrap in AnimatedSwitcher for smooth transitions
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 400),
          switchInCurve: Curves.easeInOut,
          switchOutCurve: Curves.easeInOut,
          transitionBuilder: (Widget child, Animation<double> animation) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
          child: KeyedSubtree(
            key: ValueKey(constraints.maxWidth > SizeConfig.tabletBreakPoint
                ? 'desktop'
                : constraints.maxWidth > SizeConfig.mobileBreakPoint
                    ? 'tablet'
                    : 'mobile'),
            child: currentLayout,
          ),
        );
      },
    );
  }
}
