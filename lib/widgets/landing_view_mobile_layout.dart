import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/core/constants/app_assets.dart';
import 'package:portfolio/cubit/landing_cubit.dart';
import 'package:portfolio/features/experience/views/landing_view_mobile_experience_tab.dart';
import 'package:portfolio/features/home/views/landing_view_mobile_home_tab.dart';
import 'package:portfolio/widgets/landing_view_mobile_skills_tab.dart';

class LandingViewMobileLayout extends StatelessWidget {
  const LandingViewMobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(Assets.imagesMobileGridPattern, fit: BoxFit.cover),
        ),
        BlocSelector<LandingCubit, LandingState, int>(
          selector: (state) => state.selectedTabNavIndex,
          builder: (context, selectedTabNavIndex) {
            switch (selectedTabNavIndex) {
              case 0:
                return const LandingViewMobileHomeTab();
              case 1:
                return const LandingViewMobileSkillsTab();
              case 2:
                return const LandingViewMobileExperienceTab();
              default:
                return Container();
            }
          },
        ),
      ],
    );
  }
}
