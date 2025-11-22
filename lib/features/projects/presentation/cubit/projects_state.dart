part of 'projects_cubit.dart';

abstract class ProjectsState extends Equatable {
  const ProjectsState();

  @override
  List<Object> get props => [];
}

class ProjectsInitial extends ProjectsState {}

class ProjectsLoading extends ProjectsState {}

class ProjectsLoaded extends ProjectsState {
  final List<ProjectEntity> projects;

  const ProjectsLoaded({required this.projects});

  @override
  List<Object> get props => [projects];
}

class ProjectsError extends ProjectsState {
  final String message;

  const ProjectsError({required this.message});

  @override
  List<Object> get props => [message];
}
