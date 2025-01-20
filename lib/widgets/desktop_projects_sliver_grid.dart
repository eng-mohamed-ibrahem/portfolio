import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:portfolio/core/serivce_locator/inject.dart';
import 'package:portfolio/core/utils/runtime_cache/runtime_cache.dart';
import 'package:portfolio/core/shared_widgets/project_item.dart';

class DesktopProjectsSliverGrid extends StatelessWidget {
  const DesktopProjectsSliverGrid({
    super.key,
    this.childAspectRatio,
  });

  final double? childAspectRatio;

  @override
  Widget build(BuildContext context) {
    var experiences = inject<RuntimeCache>().myProjects;
    return SliverGrid.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 40.w,
        mainAxisSpacing: 32.h,
        childAspectRatio: childAspectRatio ?? 1,
      ),
      itemBuilder: (_, index) => AnimationConfiguration.staggeredGrid(
        duration: const Duration(milliseconds: 675),
        columnCount: experiences.length,
        position: index,
        child: FadeInAnimation(
          child: ScaleAnimation(
            child: ProjectItem(
              project: experiences[index],
            ),
          ),
        ),
      ),
      itemCount: experiences.length,
    );
  }
}
