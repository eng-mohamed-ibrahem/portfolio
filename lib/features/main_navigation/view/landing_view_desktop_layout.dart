import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/config/themes/app_colors.dart';
import 'package:portfolio/core/shared_widgets/animated_gradient_background.dart';
import 'package:portfolio/cubit/landing_cubit.dart';
import 'package:portfolio/features/experience/presentation/views/landing_view_desktop_experience_tab.dart';
import 'package:portfolio/features/home/presentation/views/landing_view_desktop_home_tab.dart';
import 'package:portfolio/features/projects/presentation/view/projects_view.dart';
import 'package:portfolio/features/skills/presentation/views/landing_view_desktop_skills_tab.dart';

class LandingViewDesktopLayout extends StatelessWidget {
  const LandingViewDesktopLayout({
    super.key,
    this.tabletProjectAspectRatio,
    this.tabletApproachGridCrossAxisCount,
  });

  final double? tabletProjectAspectRatio;
  final int? tabletApproachGridCrossAxisCount;

  @override
  Widget build(BuildContext context) {
    return AnimatedGradientBackground(
      colors: const [
        AppColors.background,
        AppColors.backgroundLight,
        AppColors.background,
      ],
      duration: const Duration(seconds: 15),
      child: Stack(
        children: [
          // Animated gradient overlay for depth
          const GradientOverlay(
            opacity: 0.3,
          ),
          // Particle/glow effects could be added here
          Positioned(
            top: -100,
            left: -100,
            child: Container(
              width: 400,
              height: 400,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    AppColors.primary.withValues(alpha: 0.15),
                    AppColors.primary.withValues(alpha: 0.0),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: -50,
            right: -50,
            child: Container(
              width: 500,
              height: 500,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    AppColors.accent.withValues(alpha: 0.12),
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
                  return LandingViewDesktopHomeTab(
                    tabletLayoutProjectAspectRatio: tabletProjectAspectRatio,
                    tabletApproachGridCrossAxisCount:
                        tabletApproachGridCrossAxisCount,
                  );

                case 1:
                  return const LandingViewDesktopSkillsTab();

                case 2:
                  return LandingViewDesktopExperienceTab(
                    tabletProjectAspectRatio:
                        tabletProjectAspectRatio ?? 1 / 1.2,
                  );
                case 3:
                  return const ProjectsView();
                case 4:
                  return const LandingViewDesktopExperienceTab();

                default:
                  return const LandingViewDesktopHomeTab();
              }
            },
          ),
        ],
      ),
    );
  }
}
