import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/core/service_locator/inject.dart';
import 'package:portfolio/core/shared_widgets/project_item.dart';
import 'package:portfolio/features/main_navigation/widget/tabs_nav.dart';
import 'package:portfolio/features/projects/presentation/cubit/projects_cubit.dart';

class LandingViewMobileExperienceTab extends StatelessWidget {
  const LandingViewMobileExperienceTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProjectsCubit>(
      create: (context) => inject<ProjectsCubit>()..loadProjects(),
      child: BlocBuilder<ProjectsCubit, ProjectsState>(
        builder: (context, state) {
          if (state is ProjectsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProjectsLoaded) {
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
                    horizontal: AppConstants.mobileHorizontalPadVal.w,
                    vertical: 48.h,
                  ),
                  sliver: SliverList.separated(
                    itemCount: state.projects.length,
                    itemBuilder: (_, index) =>
                        AnimationConfiguration.staggeredList(
                      duration: const Duration(milliseconds: 675),
                      position: index,
                      child: FadeInAnimation(
                        child: ScaleAnimation(
                          child: ProjectItem(
                            project: state.projects[index],
                          ),
                        ),
                      ),
                    ),
                    separatorBuilder: (_, __) => SizedBox(height: 24.h),
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
