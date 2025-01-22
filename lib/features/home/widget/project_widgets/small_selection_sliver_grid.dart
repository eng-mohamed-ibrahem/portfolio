import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/core/serivce_locator/inject.dart';
import 'package:portfolio/core/utils/runtime_cache/runtime_cache.dart';
import 'package:portfolio/features/home/widget/project_widgets/animated_project_item.dart';

class SmallSelectionSliverGrid extends StatelessWidget {
  const SmallSelectionSliverGrid({
    super.key,
    this.tabletLayoutChildAspectRatio,
  });

  final double? tabletLayoutChildAspectRatio;

  @override
  Widget build(BuildContext context) {
    return SliverGrid.count(
      crossAxisCount: 2,
      crossAxisSpacing: 40.w,
      childAspectRatio: tabletLayoutChildAspectRatio ?? 1,
      mainAxisSpacing: 32.h,
      children: List.generate(
        inject<RuntimeCache>().myProjects.length,
        (index) => AnimatedProjectItem(
          project: inject<RuntimeCache>().myProjects[index],
          index: index,
        ),
        growable: false,
      ),
    );
  }
}
