import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/core/constants/app_strings.dart';
import 'package:portfolio/core/serivce_locator/inject.dart';
import 'package:portfolio/features/main_navigation/widget/tabs_nav.dart';
import 'package:portfolio/features/skills/presentation/cubit/skills_cubit.dart';
import 'package:portfolio/features/skills/widgets/skills_progress_list.dart';
import 'package:portfolio/features/skills/widgets/skills_tab_big_text.dart';
import 'package:portfolio/widgets/landing_view_big_text.dart';

class LandingViewMobileSkillsTab extends StatelessWidget {
  const LandingViewMobileSkillsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SkillsCubit>(
      create: (context) => inject<SkillsCubit>()..fetchSkills(),
      child: BlocBuilder<SkillsCubit, SkillsState>(
        builder: (context, state) {
          if (state is SkillsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is SkillsLoaded) {
            return CustomScrollView(
              slivers: <Widget>[
                SliverPadding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppConstants.mobileHorizontalPadVal.w,
                  ),
                  sliver: const SliverToBoxAdapter(child: TabsNav()),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 32.h),
                    child: const HeaderDescriptionText(
                      text: AppStrings.masteringTheArtOfFlutter,
                    ),
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppConstants.mobileHorizontalPadVal.w,
                  ),
                  sliver: const SliverToBoxAdapter(
                    child: SkillsTabBigText(),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: AppConstants.mobileHorizontalPadVal.w,
                      vertical: 40.h,
                    ),
                    child: SkillsProgressList(skills: state.skills),
                  ),
                ),
              ],
            );
          } else if (state is SkillsError) {
            return Center(child: Text(state.message));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
