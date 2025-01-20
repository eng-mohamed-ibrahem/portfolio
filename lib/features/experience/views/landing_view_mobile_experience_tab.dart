import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/core/utils/runtime_cache/runtime_cache.dart';
import 'package:portfolio/core/shared_widgets/project_item.dart';
import 'package:portfolio/features/main_navigation/widget/tabs_nav.dart';

import '../../../core/serivce_locator/inject.dart';

class LandingViewMobileExperienceTab extends StatelessWidget {
  const LandingViewMobileExperienceTab({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: EdgeInsets.symmetric(
            horizontal: AppConstants.mobileHorizontalPadVal.w,
          ),
          sliver: const SliverToBoxAdapter(child: TabsNav()),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(
            horizontal: AppConstants.mobileHorizontalPadVal.w,
            vertical: 48.h,
          ),
          sliver: SliverList.builder(
            itemCount: inject<RuntimeCache>().myProjects.length,
            itemBuilder: (_, index) => AnimationConfiguration.staggeredList(
              duration: const Duration(milliseconds: 675),
              position: index,
              child: FadeInAnimation(
                child: ScaleAnimation(
                  child: AspectRatio(
                    aspectRatio: 0.7,
                    child: ProjectItem(
                      project: inject<RuntimeCache>().myProjects[index],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
