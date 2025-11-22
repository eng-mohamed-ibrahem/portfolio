import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:portfolio/core/usecases/usecase.dart';
import 'package:portfolio/features/projects/domain/entities/project_entity.dart';
import 'package:portfolio/features/projects/domain/usecases/get_projects.dart';

part 'projects_state.dart';

class ProjectsCubit extends Cubit<ProjectsState> {
  final GetProjects getProjects;

  ProjectsCubit({required this.getProjects}) : super(ProjectsInitial());

  Future<void> loadProjects() async {
    emit(ProjectsLoading());
    final failureOrProjects = await getProjects(NoParams());
    failureOrProjects.fold(
      (failure) => emit(ProjectsError(message: failure.message)),
      (projects) => emit(ProjectsLoaded(projects: projects)),
    );
  }
}
