import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/size_config.dart';
import 'package:portfolio/core/shared_widgets/project_item.dart';
import 'package:portfolio/features/projects/domain/entities/project_entity.dart';
import 'package:visibility_detector/visibility_detector.dart';

class AnimatedProjectItem extends StatefulWidget {
  const AnimatedProjectItem({
    super.key,
    required this.project,
    required this.index,
  });

  final ProjectEntity project;
  final int index;

  @override
  State<AnimatedProjectItem> createState() => _AnimatedProjectItemState();
}

class _AnimatedProjectItemState extends State<AnimatedProjectItem> {
  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > SizeConfig.mobileBreakPoint &&
        screenWidth <= SizeConfig.tabletBreakPoint;

    return VisibilityDetector(
      key: ValueKey('small_selection_sliver_grid_${widget.index}'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction >= 0.95 && !_isVisible) {
          setState(() => _isVisible = true);
        }
      },
      child: _isVisible
          ? widget.index.isEven
              ? FadeInLeft(
                  duration: const Duration(milliseconds: 500),
                  child: ProjectItem(
                    key:
                        ValueKey('small_selection_sliver_grid_${widget.index}'),
                    project: widget.project,
                    isTablet: isTablet,
                  ),
                )
              : FadeInRight(
                  key: ValueKey('small_selection_sliver_grid_${widget.index}'),
                  duration: const Duration(milliseconds: 500),
                  child: ProjectItem(
                    project: widget.project,
                    isTablet: isTablet,
                  ),
                )
          : ProjectItem(
              key: ValueKey('small_selection_sliver_grid_${widget.index}'),
              project: widget.project,
              isTablet: isTablet,
            ),
    );
  }
}
