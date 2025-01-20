import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/features/experience/widget/desktop_projects_sliver_grid.dart';
import 'package:portfolio/features/main_navigation/widget/tabs_nav.dart';

class LandingViewDesktopExperienceTab extends StatelessWidget {
  const LandingViewDesktopExperienceTab({
    super.key,
    this.tabletProjectAspectRatio,
  });

  final double? tabletProjectAspectRatio;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: Align(child: TabsNav()),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(vertical: 56.h, horizontal: 100.w),
          sliver: DesktopProjectsSliverGrid(
            childAspectRatio: tabletProjectAspectRatio,
          ),
        ),
      ],
    );
  }
}
