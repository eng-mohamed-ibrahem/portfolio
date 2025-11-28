import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
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
    final int crossAxisCount = ResponsiveSize.gridCrossAxisCount(
      context,
      mobile: 1,
      smallTablet: 1,
      largeTablet: 2,
      desktop: 2,
    );

    return SliverGrid.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 40.w,
        mainAxisSpacing: 32.h,
        childAspectRatio: childAspectRatio ?? 1,
      ),
      itemBuilder: (_, index) => AnimationConfiguration.staggeredGrid(
        duration: const Duration(milliseconds: 675),
        columnCount: crossAxisCount,
        position: index,
        child: FadeInAnimation(
          child: ScaleAnimation(
            child: ProjectItem(
              project: projects[index],
              isTablet: crossAxisCount == 1,
            ),
          ),
        ),
      ),
      itemCount: isHome ? 4 : projects.length,
    );
  }
}
