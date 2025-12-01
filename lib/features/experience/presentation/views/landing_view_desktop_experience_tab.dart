import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/core/constants/size_config.dart';
import 'package:portfolio/core/helpers/responsive_padding.dart';
import 'package:portfolio/core/service_locator/inject.dart';
import 'package:portfolio/core/shared_widgets/project_item.dart';
import 'package:portfolio/features/main_navigation/widget/tabs_nav.dart';
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
            final screenWidth = MediaQuery.of(context).size.width;
            final isTablet = screenWidth > SizeConfig.mobileBreakPoint &&
                screenWidth <= SizeConfig.tabletBreakPoint;
            final isDesktop = screenWidth > SizeConfig.tabletBreakPoint;

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
                SliverPadding(
                  padding: EdgeInsets.symmetric(
                    vertical: ResponsivePadding.vertical(context) * 1.5,
                    horizontal: ResponsivePadding.horizontal(context),
                  ),
                  sliver: isDesktop
                      ? _buildDesktopGrid(state.projects)
                      : _buildTabletList(state.projects, isTablet),
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

  Widget _buildDesktopGrid(List projects) {
    return SliverGrid.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 40.w,
        mainAxisSpacing: 40.h,
        // childAspectRatio: 1 / 1.15,
      ),
      itemCount: projects.length,
      itemBuilder: (context, index) {
        return ProjectItem(
          project: projects[index],
          isTablet: false,
        );
      },
    );
  }

  Widget _buildTabletList(List projects, bool isTablet) {
    return SliverList.builder(
      itemCount: projects.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: ResponsiveSize.spacing(context, base: 32.0),
          ),
          child: ProjectItem(
            project: projects[index],
            isTablet: isTablet,
          ),
        );
      },
    );
  }
}
