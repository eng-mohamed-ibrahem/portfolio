import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/features/home/widget/project_widgets/animated_project_item.dart';
import 'package:portfolio/features/projects/domain/entities/project_entity.dart';

class SmallSelectionSliverGrid extends StatelessWidget {
  const SmallSelectionSliverGrid({
    super.key,
    this.tabletLayoutChildAspectRatio,
    required this.projects,
  });

  final double? tabletLayoutChildAspectRatio;
  final List<ProjectEntity> projects;

  @override
  Widget build(BuildContext context) {
    return SliverGrid.count(
      crossAxisCount: 2,
      crossAxisSpacing: 40.w,
      childAspectRatio: tabletLayoutChildAspectRatio ?? 1,
      mainAxisSpacing: 32.h,
      children: List.generate(
        projects.length,
        (index) => AnimatedProjectItem(
          project: projects[index],
          index: index,
        ),
        growable: false,
      ),
    );
  }
}
