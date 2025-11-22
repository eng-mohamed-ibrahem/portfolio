part of 'skills_cubit.dart';

abstract class SkillsState extends Equatable {
  const SkillsState();

  @override
  List<Object> get props => [];
}

class SkillsInitial extends SkillsState {}

class SkillsLoading extends SkillsState {}

class SkillsLoaded extends SkillsState {
  final List<SkillEntity> skills;

  const SkillsLoaded({required this.skills});

  @override
  List<Object> get props => [skills];
}

class SkillsError extends SkillsState {
  final String message;

  const SkillsError({required this.message});

  @override
  List<Object> get props => [message];
}
