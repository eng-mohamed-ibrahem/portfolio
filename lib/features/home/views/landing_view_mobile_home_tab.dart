import 'package:portfolio/features/experience/domain/entities/experience_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/core/constants/app_strings.dart';
import 'package:portfolio/core/serivce_locator/inject.dart';
import 'package:portfolio/core/shared_widgets/main_button.dart';
import 'package:portfolio/core/utils/runtime_cache/runtime_cache.dart';
import 'package:portfolio/cubit/landing_cubit.dart';
import 'package:portfolio/features/experience/widget/experience_item.dart';
import 'package:portfolio/features/home/presentation/cubit/home_cubit.dart';
import 'package:portfolio/features/home/widget/contact_me_widgets/contact_me_section.dart';
import 'package:portfolio/features/home/widget/copy_my_email_card.dart';
import 'package:portfolio/features/home/widget/project_widgets/animated_project_item.dart';
import 'package:portfolio/features/home/widget/see_my_work_and_download_cv_buttons.dart';
import 'package:portfolio/features/home/widget/sub_info/prioritize_img.dart';
import 'package:portfolio/features/home/widget/sub_info/tech_enthusiast_card.dart';
import 'package:portfolio/features/main_navigation/widget/tabs_nav.dart';
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
                SliverPadding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppConstants.mobileHorizontalPadVal.w,
                  ),
                  sliver: const SliverToBoxAdapter(child: TabsNav()),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    margin: EdgeInsets.only(top: 40.h, bottom: 20.h),
                    child: HeaderSmallText(text: state.homeEntity.title),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 56.w),
                    child: HeaderDescriptionText(text: state.homeEntity.name),
                  ),
                ),
                const SliverToBoxAdapter(
                  child: AnimatedPersonalInfo(),
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
                  sliver: SliverList.builder(
                    itemCount: 4,
                    itemBuilder: (_, index) =>
                        AnimationConfiguration.staggeredList(
                      duration: const Duration(milliseconds: 675),
                      position: index,
                      child: FadeInAnimation(
                        child: ScaleAnimation(
                          child: AspectRatio(
                            aspectRatio: 0.7,
                            child: AnimatedProjectItem(
                              project: inject<RuntimeCache>().myProjects[index],
                              index: index,
                            ),
                          ),
                        ),
                      ),
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
                SliverList.builder(
                  itemCount: inject<RuntimeCache>().myExperience.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(
                        left: AppConstants.mobileHorizontalPadVal.w,
                        right: AppConstants.mobileHorizontalPadVal.w,
                      ),
                      child: ExperienceItem(
                        experience: inject<RuntimeCache>().myExperience[index]
                            as ExperienceEntity,
                      ),
                    );
                  },
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
