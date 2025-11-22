import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/config/themes/app_colors.dart';
import 'package:portfolio/config/themes/app_text_styles.dart';
import 'package:portfolio/features/projects/presentation/cubit/projects_cubit.dart';
import 'package:portfolio/features/projects/presentation/widgets/project_card.dart';

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
          return ListView.separated(
            padding: EdgeInsets.all(24.w),
            itemCount: state.projects.length,
            separatorBuilder: (context, index) => SizedBox(height: 24.h),
            itemBuilder: (context, index) {
              return ProjectCard(project: state.projects[index]);
            },
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
