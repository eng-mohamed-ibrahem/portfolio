import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/core/serivce_locator/inject.dart';
import 'package:portfolio/features/experience/presentation/cubit/experience_cubit.dart';

import 'package:portfolio/features/experience/presentation/widget/experience_item.dart';
import 'package:portfolio/features/main_navigation/widget/tabs_nav.dart';

class LandingViewDesktopExperienceTab extends StatelessWidget {
  const LandingViewDesktopExperienceTab({
    super.key,
    this.tabletProjectAspectRatio,
  });

  final double? tabletProjectAspectRatio;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ExperienceCubit>(
      create: (context) => inject<ExperienceCubit>()..fetchExperience(),
      child: BlocBuilder<ExperienceCubit, ExperienceState>(
        builder: (context, state) {
          if (state is ExperienceLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ExperienceLoaded) {
            return CustomScrollView(
              slivers: [
                const SliverToBoxAdapter(
                  child: Align(child: TabsNav()),
                ),
                SliverPadding(
                  padding:
                      EdgeInsets.symmetric(vertical: 56.h, horizontal: 100.w),
                  sliver: SliverList.builder(
                    itemCount: state.experienceList.length,
                    itemBuilder: (context, index) {
                      final experience = state.experienceList[index];
                      return Container(
                        margin: EdgeInsets.only(
                          top: 20.h,
                          bottom: 30.h,
                          left: 90.w,
                          right: 90.w,
                        ),
                        child: ExperienceItem(
                          experience: experience,
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          } else if (state is ExperienceError) {
            return Center(child: Text(state.message));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
