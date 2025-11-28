import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/config/themes/app_colors.dart';
import 'package:portfolio/core/shared_widgets/animated_gradient_background.dart';
import 'package:portfolio/cubit/landing_cubit.dart';
import 'package:portfolio/features/experience/presentation/views/landing_view_mobile_experience_tab.dart';
import 'package:portfolio/features/home/presentation/views/landing_view_mobile_home_tab.dart';
import 'package:portfolio/features/projects/presentation/view/projects_view.dart';
import 'package:portfolio/features/skills/presentation/views/landing_view_mobile_skills_tab.dart';

class LandingViewMobileLayout extends StatelessWidget {
  const LandingViewMobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedGradientBackground(
      colors: const [
        AppColors.background,
        AppColors.backgroundLight,
        AppColors.background,
      ],
      duration: const Duration(seconds: 12),
      child: Stack(
        children: [
          // Subtle gradient overlay for mobile
          const GradientOverlay(opacity: 0.2),
          // Accent glow (smaller for mobile)
          Positioned(
            top: -50,
            right: -50,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    AppColors.accent.withValues(alpha: 0.1),
                    AppColors.accent.withValues(alpha: 0.0),
                  ],
                ),
              ),
            ),
          ),
          // Main content
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
                case 3:
                  return const ProjectsView();
                case 4:
                  return const LandingViewMobileExperienceTab();
                default:
                  return Container();
              }
            },
          ),
        ],
      ),
    );
  }
}
