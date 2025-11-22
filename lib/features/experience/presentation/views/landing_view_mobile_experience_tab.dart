import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/core/serivce_locator/inject.dart';
import 'package:portfolio/features/experience/presentation/cubit/experience_cubit.dart';
import 'package:portfolio/features/experience/presentation/widget/experience_item.dart';
import 'package:portfolio/features/main_navigation/widget/tabs_nav.dart';

class LandingViewMobileExperienceTab extends StatelessWidget {
  const LandingViewMobileExperienceTab({super.key});

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
                    itemCount: state.experienceList.length,
                    itemBuilder: (_, index) => AnimationConfiguration.staggeredList(
                      duration: const Duration(milliseconds: 675),
                      position: index,
                      child: FadeInAnimation(
                        child: ScaleAnimation(
                          child: AspectRatio(
                            aspectRatio: 0.7,
                            child: ExperienceItem(
                              experience: state.experienceList[index],
                            ),
                          ),
                        ),
                      ),
                    ),
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
