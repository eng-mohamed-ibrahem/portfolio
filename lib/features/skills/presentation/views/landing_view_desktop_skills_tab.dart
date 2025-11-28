import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/core/constants/app_strings.dart';
import 'package:portfolio/core/helpers/responsive_padding.dart';
import 'package:portfolio/core/service_locator/inject.dart';
import 'package:portfolio/features/skills/presentation/cubit/skills_cubit.dart';
import 'package:portfolio/features/skills/presentation/widgets/skills_progress_list.dart';
import 'package:portfolio/features/skills/presentation/widgets/skills_tab_big_text.dart';
import 'package:portfolio/widgets/landing_view_big_text.dart';

class LandingViewDesktopSkillsTab extends StatelessWidget {
  const LandingViewDesktopSkillsTab({super.key});

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
              slivers: [
                SliverToBoxAdapter(
                  child: Container(
                    margin: EdgeInsets.only(top: 73.h, bottom: 22.h),
                    child: const HeaderSmallText(
                      text: AppStrings.masteringTheArtOfFlutter,
                    ),
                  ),
                ),
                const SliverToBoxAdapter(
                  child: Align(
                    child: SkillsTabBigText(),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    margin: EdgeInsets.only(
                      top: 32.h,
                      left: ResponsivePadding.horizontal(context),
                      right: ResponsivePadding.horizontal(context),
                      bottom: 32.h,
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
