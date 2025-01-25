import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:portfolio/core/helpers/extensions.dart';
import 'package:portfolio/core/serivce_locator/inject.dart';
import 'package:portfolio/core/shared_widgets/project_item.dart';
import 'package:portfolio/core/utils/runtime_cache/runtime_cache.dart';

class DesktopProjectsSliverGrid extends StatelessWidget {
  const DesktopProjectsSliverGrid({
    super.key,
    this.childAspectRatio,
    this.isHome = false,
  });

  final double? childAspectRatio;
  final bool isHome;

  @override
  Widget build(BuildContext context) {
    var projects = inject<RuntimeCache>().myProjects;

    return context.isTablet
        ? SliverList.separated(
            itemBuilder: (_, index) => AnimationConfiguration.staggeredList(
              duration: const Duration(milliseconds: 675),
              position: index,
              child: FadeInAnimation(
                child: ScaleAnimation(
                  child: ProjectItem(
                    project: projects[index],
                    isTablet: true,
                  ),
                ),
              ),
            ),
            separatorBuilder: (_, __) => SizedBox(height: 32.h),
            itemCount: isHome ? 4 : projects.length,
          )
        : SliverGrid.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 40.w,
              mainAxisSpacing: 32.h,
              childAspectRatio: childAspectRatio ?? 1,
            ),
            itemBuilder: (_, index) => AnimationConfiguration.staggeredGrid(
              duration: const Duration(milliseconds: 675),
              columnCount: projects.length,
              position: index,
              child: FadeInAnimation(
                child: ScaleAnimation(
                  child: ProjectItem(
                    project: projects[index],
                  ),
                ),
              ),
            ),
            itemCount: isHome ? 4 : projects.length,
          );
  }
}
