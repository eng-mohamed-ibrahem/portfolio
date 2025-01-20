import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/core/constants/app_strings.dart';
import 'package:portfolio/core/serivce_locator/inject.dart';
import 'package:portfolio/core/shared_widgets/main_button.dart';
import 'package:portfolio/core/utils/runtime_cache/runtime_cache.dart';
import 'package:portfolio/cubit/landing_cubit.dart';
import 'package:portfolio/features/experience/widget/experience_item.dart';
import 'package:portfolio/features/home/widget/contact_me_widgets/contact_me_section.dart';
import 'package:portfolio/features/home/widget/copy_my_email_card.dart';
import 'package:portfolio/features/home/widget/project_widgets/animated_project_item.dart';
import 'package:portfolio/features/home/widget/see_my_work_and_download_cv_buttons.dart';
import 'package:portfolio/features/home/widget/sub_info/prioritize_img.dart';
import 'package:portfolio/features/home/widget/sub_info/tech_enthusiast_card.dart';
import 'package:portfolio/features/main_navigation/widget/tabs_nav.dart';
import 'package:portfolio/widgets/custom_section_title.dart';
import 'package:portfolio/widgets/landing_view_big_text.dart';

class LandingViewMobileHomeTab extends StatelessWidget {
  const LandingViewMobileHomeTab({super.key});

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
        SliverToBoxAdapter(
          child: Container(
            margin: EdgeInsets.only(top: 40.h, bottom: 20.h),
            child: const HeaderSmallText(text: AppStrings.dynamicAppMagic),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 56.w),
            child: const LandingViewBigText(),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 24.h, horizontal: 56.w),
            child: const FittedBox(
              child: HeaderDescriptionText(
                text: AppStrings.introduction,
              ),
            ),
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
              top: 200.h,
              bottom: 150.h,
              left: 24.w,
              right: 24.w,
            ),
            child: OverflowBar(
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
        // const SliverToBoxAdapter(
        //   child: Align(
        //     child: CustomSectionTitle(
        //       whiteSpan: '${AppStrings.my} ',
        //       colorfulSpan: AppStrings.myProjects,
        //     ),
        //   ),
        // ),

        // SliverPadding(
        //   padding: EdgeInsets.symmetric(
        //     horizontal: AppConstants.mobileHorizontalPadVal.w,
        //     vertical: 48.h,
        //   ),
        //   sliver: SliverList.builder(
        //     itemCount: inject<RuntimeCache>().myProjects.length,
        //     itemBuilder: (_, index) => AnimationConfiguration.staggeredList(
        //       duration: const Duration(milliseconds: 675),
        //       position: index,
        //       child: FadeInAnimation(
        //         child: ScaleAnimation(
        //           child: AspectRatio(
        //             aspectRatio: 0.7,
        //             child: ProjectItem(
        //               project: inject<RuntimeCache>().myProjects[index],
        //             ),
        //           ),
        //         ),
        //       ),
        //     ),
        //   ),
        // ),

        SliverToBoxAdapter(
          child: Container(
            margin: EdgeInsets.only(
              left: 64.w,
              right: 64.w,
              top: 64.h,
              bottom: 24.h,
            ),
            child: const CustomSectionTitle(
              whiteSpan: '${AppStrings.my} ',
              colorfulSpan: AppStrings.recentProjects,
            ),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(
            horizontal: AppConstants.mobileHorizontalPadVal.w,
          ),
          sliver: SliverToBoxAdapter(
            child: Column(
              spacing: 20.h,
              children: List.generate(
                4,
                (index) => AspectRatio(
                  aspectRatio: 0.7,
                  child: AnimatedProjectItem(
                    project: inject<RuntimeCache>().myProjects[index],
                    index: index,
                  ),
                ),
                growable: false,
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: MainButton(
            width: double.infinity,
            onPressed: () => context.read<LandingCubit>().selectTabNav(2),
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
                experience: inject<RuntimeCache>().myExperience[index],
              ),
            );
          },
        ),
        // SliverToBoxAdapter(
        //   child: Container(
        //     margin: EdgeInsets.only(bottom: 36.h, top: 64.h),
        //     child: const CustomSectionTitle(
        //       whiteSpan: '${AppStrings.my} ',
        //       colorfulSpan: AppStrings.approach,
        //     ),
        //   ),
        // ),
        // SliverToBoxAdapter(
        //   child: Container(
        //     margin: EdgeInsets.symmetric(
        //       horizontal: AppConstants.mobileHorizontalPadVal.w,
        //     ),
        //     child: OverflowBar(
        //       overflowSpacing: 48.w,
        //       alignment: MainAxisAlignment.center,
        //       spacing: 40.w,
        //       children: List.generate(
        //         Approach.myApproach.length,
        //         (index) => AspectRatio(
        //           aspectRatio: 398 / 500,
        //           child: ApproachItem(
        //             approach: Approach.myApproach[index],
        //             index: index,
        //           ),
        //         ),
        //         growable: false,
        //       ),
        //     ),
        //   ),
        // ),
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
  }
}
