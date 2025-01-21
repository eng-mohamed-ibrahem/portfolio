import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/core/constants/app_strings.dart';
import 'package:portfolio/core/serivce_locator/inject.dart';
import 'package:portfolio/core/shared_widgets/main_button.dart';
import 'package:portfolio/core/utils/runtime_cache/runtime_cache.dart';
import 'package:portfolio/cubit/landing_cubit.dart';
import 'package:portfolio/features/experience/widget/experience_item.dart';
import 'package:portfolio/features/home/widget/animated_personal_info.dart';
import 'package:portfolio/features/home/widget/contact_me_widgets/contact_me_section.dart';
import 'package:portfolio/features/home/widget/project_widgets/small_selection_sliver_grid.dart';
import 'package:portfolio/features/home/widget/see_my_work_and_download_cv_buttons.dart';
import 'package:portfolio/features/home/widget/sub_info/desktop_passion_and_purpose_section.dart';
import 'package:portfolio/features/main_navigation/widget/tabs_nav.dart';
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
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: Align(
            child: TabsNav(),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            margin: EdgeInsets.only(top: 73.h, bottom: 22.h),
            child: const HeaderSmallText(text: AppStrings.dynamicAppMagic),
          ),
        ),
        const SliverToBoxAdapter(
          child: Align(
            child: LandingViewBigText(),
          ),
        ),
        // SliverToBoxAdapter(
        //   child: Container(
        //     margin: EdgeInsets.only(top: 30.h, bottom: 5.h),
        //     alignment: Alignment.center,
        //     child: Text(
        //       '${AppStrings.introduction} ',
        //       style: AppTextStyles.font24Regular(context),
        //     ),
        //   ),
        // ),
        const SliverToBoxAdapter(
          child: AnimatedPersonalInfo(),
        ),
        const SliverToBoxAdapter(
          child: SeeMyWorkAndDownloadCVButtons(),
        ),
        SliverToBoxAdapter(
          child: Container(
            margin: EdgeInsets.only(
              top: 206.h,
              bottom: 150.h,
              left: 24.w,
              right: 24.w,
            ),
            child: const DesktopPassionAndPurposeSection(),
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
        //   padding: EdgeInsets.symmetric(vertical: 56.h, horizontal: 100.w),
        //   sliver: const DesktopProjectsSliverGrid(),
        // ),

        const SliverToBoxAdapter(
          child: Align(
            child: CustomSectionTitle(
              whiteSpan: '${AppStrings.my} ',
              colorfulSpan: AppStrings.recentProjects,
            ),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(vertical: 48.h, horizontal: 100.w),
          sliver: SmallSelectionSliverGrid(
            tabletLayoutChildAspectRatio: tabletLayoutProjectAspectRatio,
          ),
        ),
        SliverToBoxAdapter(
          child: Align(
            child: MainButton(
              margin: EdgeInsets.only(bottom: 150.h),
              onPressed: () => context.read<LandingCubit>().selectTabNav(2),
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
        SliverList.builder(
          itemCount: inject<RuntimeCache>().myExperience.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(
                top: 20.h,
                bottom: 30.h,
                left: 90.w,
                right: 90.w,
              ),
              child: ExperienceItem(
                experience: inject<RuntimeCache>().myExperience[index],
              ),
            );
          },
        ),
        // SliverToBoxAdapter(
        //   child: Align(
        //     child: Container(
        //       margin: EdgeInsets.only(top: 60.h),
        //       child: const CustomSectionTitle(
        //         whiteSpan: 'How I ',
        //         colorfulSpan: "Work",
        //       ),
        //     ),
        //   ),
        // ),
        // const SliverToBoxAdapter(
        //   child: HowIWork(),
        // ),
        const SliverToBoxAdapter(
          child: ContactMeSection(aspectRatio: 2),
        ),
      ],
    );
  }
}
