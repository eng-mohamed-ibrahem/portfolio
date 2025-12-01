import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/config/themes/app_colors.dart';
import 'package:portfolio/config/themes/app_text_styles.dart';
import 'package:portfolio/core/helpers/responsive_padding.dart';
import 'package:portfolio/core/shared_widgets/project_item.dart';
import 'package:portfolio/features/main_navigation/widget/tabs_nav.dart';
import 'package:portfolio/features/projects/presentation/cubit/projects_cubit.dart';

class ProjectsView extends StatefulWidget {
  const ProjectsView({super.key});

  @override
  State<ProjectsView> createState() => _ProjectsViewState();
}

class _ProjectsViewState extends State<ProjectsView> {
  @override
  void initState() {
    super.initState();
    context.read<ProjectsCubit>().loadProjects();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProjectsCubit, ProjectsState>(
      builder: (context, state) {
        if (state is ProjectsLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ProjectsLoaded) {
          final int crossAxisCount = ResponsiveSize.gridCrossAxisCount(
            context,
            mobile: 1,
            smallTablet: 1,
            largeTablet: 2,
            desktop: 3,
          );

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
                padding: EdgeInsets.all(ResponsivePadding.horizontal(context)),
                sliver: SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: 24.w,
                    mainAxisSpacing: 24.h,
                    childAspectRatio: 1 / 1.2,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return ProjectItem(project: state.projects[index]);
                    },
                    childCount: state.projects.length,
                  ),
                ),
              ),
            ],
          );
        } else if (state is ProjectsError) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.error_outline,
                  size: 64.sp,
                  color: AppColors.colorBEC1DD,
                ),
                SizedBox(height: 16.h),
                Text(
                  state.message,
                  style: AppTextStyles.font20Medium(context),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
