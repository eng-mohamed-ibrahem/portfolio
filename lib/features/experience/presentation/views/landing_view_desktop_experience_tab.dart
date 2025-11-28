import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/core/helpers/responsive_padding.dart';
import 'package:portfolio/core/service_locator/inject.dart';
import 'package:portfolio/core/shared_widgets/project_item.dart';
import 'package:portfolio/features/projects/presentation/cubit/projects_cubit.dart';

class LandingViewDesktopExperienceTab extends StatelessWidget {
  const LandingViewDesktopExperienceTab({
    super.key,
    this.tabletProjectAspectRatio,
  });

  final double? tabletProjectAspectRatio;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProjectsCubit>(
      create: (context) => inject<ProjectsCubit>()..loadProjects(),
      child: BlocBuilder<ProjectsCubit, ProjectsState>(
        builder: (context, state) {
          if (state is ProjectsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProjectsLoaded) {
            final int crossAxisCount = ResponsiveSize.gridCrossAxisCount(
              context,
              mobile: 1,
              smallTablet: 1,
              largeTablet: 2,
              desktop: 2,
            );

            return CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: EdgeInsets.symmetric(
                    vertical: 56.h,
                    horizontal: ResponsivePadding.horizontal(context),
                  ),
                  sliver: SliverGrid.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      crossAxisSpacing: 20.w,
                      mainAxisSpacing: 30.h,
                      childAspectRatio: tabletProjectAspectRatio ?? 1.7,
                    ),
                    itemCount: state.projects.length,
                    itemBuilder: (context, index) {
                      final project = state.projects[index];
                      return Container(
                        margin: EdgeInsets.only(
                          top: 20.h,
                          bottom: 30.h,
                        ),
                        child: ProjectItem(
                          project: project,
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          } else if (state is ProjectsError) {
            return Center(child: Text(state.message));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
