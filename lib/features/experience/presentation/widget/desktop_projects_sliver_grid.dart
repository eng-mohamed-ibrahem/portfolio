import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:portfolio/core/constants/size_config.dart';
import 'package:portfolio/core/helpers/responsive_padding.dart';
import 'package:portfolio/core/shared_widgets/project_item.dart';
import 'package:portfolio/features/projects/domain/entities/project_entity.dart';

class DesktopProjectsSliverGrid extends StatelessWidget {
  const DesktopProjectsSliverGrid({
    super.key,
    this.childAspectRatio,
    this.isHome = false,
    required this.projects,
  });

  final double? childAspectRatio;
  final bool isHome;
  final List<ProjectEntity> projects;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > SizeConfig.mobileBreakPoint &&
        screenWidth <= SizeConfig.tabletBreakPoint;
    final isDesktop = screenWidth > SizeConfig.tabletBreakPoint;
    final itemCount =
        isHome ? (projects.length >= 4 ? 4 : projects.length) : projects.length;

    // Use list for tablets, grid for desktop
    if (isDesktop) {
      return SliverGrid.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 40.w,
          mainAxisSpacing: 40.h,
          // childAspectRatio: childAspectRatio ?? 0.75,
        ),
        itemCount: itemCount,
        itemBuilder: (_, index) => AnimationConfiguration.staggeredGrid(
          duration: const Duration(milliseconds: 675),
          columnCount: 2,
          position: index,
          child: FadeInAnimation(
            child: ScaleAnimation(
              child: ProjectItem(
                project: projects[index],
                isTablet: false,
              ),
            ),
          ),
        ),
      );
    } else {
      // Tablet layout - use list with horizontal cards
      return SliverList.builder(
        itemCount: itemCount,
        itemBuilder: (_, index) => AnimationConfiguration.staggeredList(
          duration: const Duration(milliseconds: 675),
          position: index,
          child: FadeInAnimation(
            child: ScaleAnimation(
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: ResponsiveSize.spacing(context, base: 32.0),
                ),
                child: ProjectItem(
                  project: projects[index],
                  isTablet: isTablet,
                ),
              ),
            ),
          ),
        ),
      );
    }
  }
}
