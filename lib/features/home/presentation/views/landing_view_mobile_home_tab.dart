import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/core/constants/app_strings.dart';
import 'package:portfolio/core/service_locator/inject.dart';
import 'package:portfolio/core/shared_widgets/main_button.dart';
import 'package:portfolio/cubit/landing_cubit.dart';
import 'package:portfolio/features/experience/presentation/cubit/experience_cubit.dart';
import 'package:portfolio/features/experience/presentation/widget/experience_item.dart';
import 'package:portfolio/features/home/presentation/cubit/home_cubit.dart';
import 'package:portfolio/features/home/presentation/widget/contact_me_widgets/contact_me_section.dart';
import 'package:portfolio/features/home/presentation/widget/copy_my_email_card.dart';
import 'package:portfolio/features/home/presentation/widget/project_widgets/animated_project_item.dart';
import 'package:portfolio/features/home/presentation/widget/see_my_work_and_download_cv_buttons.dart';
import 'package:portfolio/features/home/presentation/widget/sub_info/prioritize_img.dart';
import 'package:portfolio/features/home/presentation/widget/sub_info/tech_enthusiast_card.dart';
import 'package:portfolio/features/main_navigation/widget/tabs_nav.dart';
import 'package:portfolio/features/projects/presentation/cubit/projects_cubit.dart';
import 'package:portfolio/widgets/custom_section_title.dart';
import 'package:portfolio/widgets/landing_view_big_text.dart';

import '../widget/animated_personal_info.dart';

class LandingViewMobileHomeTab extends StatelessWidget {
  const LandingViewMobileHomeTab({super.key});

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
                const SliverAppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  pinned: true,
                  flexibleSpace: TabsNav(),
                  collapsedHeight: kToolbarHeight,
                  expandedHeight: kToolbarHeight,
                  centerTitle: true,
                ),
                SliverToBoxAdapter(
                  child: AnimatedPersonalInfo(homeEntity: state.homeEntity),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 56.w),
                    child:
                        HeaderDescriptionText(text: state.homeEntity.summary),
                  ),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 10,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    margin: EdgeInsets.only(
                      left: AppConstants.mobileHorizontalPadVal.w,
                      right: AppConstants.mobileHorizontalPadVal.w,
                      bottom: 64.h,
                    ),
                    child: const SeeMyWorkAndDownloadCVButtons(
                      areExpanded: true,
                      gradient: AppConstants.boxSecondaryLinearGradient,
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppConstants.mobileHorizontalPadVal.w,
                    ),
                    margin: EdgeInsets.only(
                      top: 100.h,
                      bottom: 150.h,
                      left: 24.w,
                      right: 24.w,
                    ),
                    child: Wrap(
                      spacing: 24.h,
                      children: const [
                        AspectRatio(
                          aspectRatio: 1.8 / 1,
                          child: AnimatedPrioritizeImg(),
                        ),
                        Column(
                          children: [
                            AspectRatio(
                              aspectRatio: 2.3,
                              child: AnimatedTechEnthusiastCard(),
                            ),
                            AspectRatio(
                              aspectRatio: 2.3,
                              child: AnimatedCopyMyEmailCard(),
                            ),
                          ],
                        ),
                      ],
                    ),
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
                    horizontal: AppConstants.mobileHorizontalPadVal.w,
                    vertical: 48.h,
                  ),
                  sliver: BlocProvider<ProjectsCubit>(
                    create: (context) =>
                        inject<ProjectsCubit>()..loadProjects(),
                    child: BlocBuilder<ProjectsCubit, ProjectsState>(
                      builder: (context, projectsState) {
                        if (projectsState is ProjectsLoading ||
                            projectsState is ProjectsInitial) {
                          return SliverList.builder(
                            itemCount: 4,
                            itemBuilder: (_, index) =>
                                AnimationConfiguration.staggeredList(
                              duration: const Duration(milliseconds: 675),
                              position: index,
                              child: const FadeInAnimation(
                                child: ScaleAnimation(
                                  child: AspectRatio(
                                    aspectRatio: 0.7,
                                    child: Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        } else if (projectsState is ProjectsLoaded) {
                          final projects = projectsState.projects;
                          final itemCount =
                              projects.length >= 4 ? 4 : projects.length;
                          return SliverList.builder(
                            itemCount: itemCount,
                            itemBuilder: (_, index) =>
                                AnimationConfiguration.staggeredList(
                              duration: const Duration(milliseconds: 675),
                              position: index,
                              child: FadeInAnimation(
                                child: ScaleAnimation(
                                  child: AspectRatio(
                                    aspectRatio: 0.7,
                                    child: AnimatedProjectItem(
                                      project: projects[index],
                                      index: index,
                                    ),
                                  ),
                                ),
                              ),
                            ),
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
                  child: MainButton(
                    width: double.infinity,
                    onPressed: () =>
                        context.read<LandingCubit>().selectTabNav(2),
                    gradient: AppConstants.boxSecondaryLinearGradient,
                    margin: EdgeInsets.only(
                      bottom: 64.h,
                      left: AppConstants.mobileHorizontalPadVal.w,
                      right: AppConstants.mobileHorizontalPadVal.w,
                      top: AppConstants.mobileHorizontalPadVal.h,
                    ),
                    text: AppStrings.seeMyWork,
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
                                left: AppConstants.mobileHorizontalPadVal.w,
                                right: AppConstants.mobileHorizontalPadVal.w,
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
                SliverPadding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppConstants.mobileHorizontalPadVal.w,
                    vertical: 12.h,
                  ),
                  sliver: const SliverToBoxAdapter(
                    child: ContactMeSection(
                      aspectRatio: 1,
                      contactMeButtonWidth: double.infinity,
                    ),
                  ),
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
