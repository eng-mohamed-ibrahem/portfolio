import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/core/constants/app_strings.dart';
import 'package:portfolio/core/helpers/responsive_padding.dart';
import 'package:portfolio/core/service_locator/inject.dart';
import 'package:portfolio/core/shared_widgets/main_button.dart';
import 'package:portfolio/cubit/landing_cubit.dart';
import 'package:portfolio/features/experience/presentation/cubit/experience_cubit.dart';
import 'package:portfolio/features/experience/presentation/widget/desktop_projects_sliver_grid.dart';
import 'package:portfolio/features/experience/presentation/widget/experience_item.dart';
import 'package:portfolio/features/home/presentation/cubit/home_cubit.dart';
import 'package:portfolio/features/home/presentation/widget/animated_personal_info.dart';
import 'package:portfolio/features/home/presentation/widget/contact_me_widgets/contact_me_section.dart';
import 'package:portfolio/features/home/presentation/widget/see_my_work_and_download_cv_buttons.dart';
import 'package:portfolio/features/home/presentation/widget/sub_info/desktop_passion_and_purpose_section.dart';
import 'package:portfolio/features/main_navigation/widget/tabs_nav.dart';
import 'package:portfolio/features/projects/presentation/cubit/projects_cubit.dart';
import 'package:portfolio/widgets/custom_section_title.dart';
import 'package:portfolio/widgets/landing_view_big_text.dart';

class LandingViewDesktopHomeTab extends StatelessWidget {
  const LandingViewDesktopHomeTab({
    super.key,
    this.tabletLayoutProjectAspectRatio,
    this.tabletApproachGridCrossAxisCount,
  });

  final double? tabletLayoutProjectAspectRatio;
  final int? tabletApproachGridCrossAxisCount;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (context) => inject<HomeCubit>()..fetchHomeData(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is HomeLoaded) {
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
                  child: AnimatedPersonalInfo(homeEntity: state.homeEntity),
                ),
                SliverToBoxAdapter(
                  child: Align(
                    child:
                        HeaderDescriptionText(text: state.homeEntity.summary),
                  ),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 10,
                  ),
                ),
                const SliverToBoxAdapter(
                  child: SeeMyWorkAndDownloadCVButtons(),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    margin: EdgeInsets.only(
                      top: ResponsivePadding.section(context) * 1.7,
                      bottom: ResponsivePadding.section(context),
                      left: ResponsivePadding.horizontal(context),
                      right: ResponsivePadding.horizontal(context),
                    ),
                    child: const DesktopPassionAndPurposeSection(),
                  ),
                ),
                const SliverToBoxAdapter(
                  child: Align(
                    child: CustomSectionTitle(
                      whiteSpan: '${AppStrings.smallSelectionOf} ',
                      colorfulSpan: AppStrings.recentProjects,
                    ),
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.symmetric(
                    vertical: ResponsivePadding.vertical(context) * 1.75,
                    horizontal: ResponsivePadding.horizontal(context),
                  ),
                  sliver: BlocProvider<ProjectsCubit>(
                    create: (context) =>
                        inject<ProjectsCubit>()..loadProjects(),
                    child: BlocBuilder<ProjectsCubit, ProjectsState>(
                      builder: (context, projectsState) {
                        if (projectsState is ProjectsLoading ||
                            projectsState is ProjectsInitial) {
                          return const SliverToBoxAdapter(
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                        } else if (projectsState is ProjectsLoaded) {
                          return DesktopProjectsSliverGrid(
                            projects: projectsState.projects,
                            childAspectRatio: 1 / 1.15,
                            isHome: true,
                          );
                        } else if (projectsState is ProjectsError) {
                          return SliverToBoxAdapter(
                            child: Center(
                              child: Text(projectsState.message),
                            ),
                          );
                        } else {
                          return const SliverToBoxAdapter(child: SizedBox());
                        }
                      },
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Align(
                    child: MainButton(
                      width: 400,
                      margin: EdgeInsets.only(
                        bottom: ResponsivePadding.section(context),
                      ),
                      onPressed: () =>
                          context.read<LandingCubit>().selectTabNav(2),
                      text: AppStrings.seeMyworks,
                    ),
                  ),
                ),
                const SliverToBoxAdapter(
                  child: Align(
                    heightFactor: 2.5,
                    child: CustomSectionTitle(
                      whiteSpan: '${AppStrings.my} ',
                      colorfulSpan: AppStrings.workExperience,
                    ),
                  ),
                ),
                BlocProvider<ExperienceCubit>(
                  create: (context) =>
                      inject<ExperienceCubit>()..fetchExperience(),
                  child: BlocBuilder<ExperienceCubit, ExperienceState>(
                    builder: (context, experienceState) {
                      if (experienceState is ExperienceLoading ||
                          experienceState is ExperienceInitial) {
                        return const SliverToBoxAdapter(
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      } else if (experienceState is ExperienceLoaded) {
                        return SliverList.builder(
                          itemCount: experienceState.experienceList.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.only(
                                top: ResponsivePadding.vertical(context) * 0.6,
                                bottom:
                                    ResponsivePadding.vertical(context) * 0.9,
                                left: ResponsivePadding.horizontal(context),
                                right: ResponsivePadding.horizontal(context),
                              ),
                              child: ExperienceItem(
                                experience:
                                    experienceState.experienceList[index],
                              ),
                            );
                          },
                        );
                      } else if (experienceState is ExperienceError) {
                        return SliverToBoxAdapter(
                          child: Center(
                            child: Text(experienceState.message),
                          ),
                        );
                      } else {
                        return const SliverToBoxAdapter(child: SizedBox());
                      }
                    },
                  ),
                ),
                const SliverToBoxAdapter(
                  child: ContactMeSection(aspectRatio: 2),
                ),
              ],
            );
          } else if (state is HomeError) {
            return Center(child: Text(state.message));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
