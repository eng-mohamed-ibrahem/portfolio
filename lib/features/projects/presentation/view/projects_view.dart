import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/features/projects/presentation/cubit/projects_cubit.dart';

class ProjectsView extends StatelessWidget {
  const ProjectsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProjectsCubit, ProjectsState>(
      builder: (context, state) {
        if (state is ProjectsLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ProjectsLoaded) {
          return ListView.builder(
            itemCount: state.projects.length,
            itemBuilder: (context, index) {
              final project = state.projects[index];
              return ListTile(
                title: Text(project.title),
                subtitle: Text(project.description),
              );
            },
          );
        } else if (state is ProjectsError) {
          return Center(child: Text(state.message));
        } else {
          return const Center(child: Text('Initial State'));
        }
      },
    );
  }
}
