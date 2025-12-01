import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/core/constants/app_strings.dart';
import 'package:portfolio/core/helpers/responsive_padding.dart';
import 'package:portfolio/core/service_locator/inject.dart';
import 'package:portfolio/features/main_navigation/widget/tabs_nav.dart';
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
                SliverAppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  pinned: true,
                  floating: true,
                  snap: true,
                  bottom: PreferredSize(
                    preferredSize: Size.fromHeight(80.h),
                    child: const TabsNav(),
                  ),
                  collapsedHeight: kToolbarHeight,
                  expandedHeight: kToolbarHeight,
                  centerTitle: true,
                ),
                SliverToBoxAdapter(
                  child: Container(
                    margin: EdgeInsets.only(
                      top: ResponsivePadding.section(context) * 0.6,
                      bottom: ResponsivePadding.vertical(context),
                    ),
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
                      top: ResponsivePadding.vertical(context),
                      left: ResponsivePadding.horizontal(context),
                      right: ResponsivePadding.horizontal(context),
                      bottom: ResponsivePadding.section(context) * 0.5,
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
