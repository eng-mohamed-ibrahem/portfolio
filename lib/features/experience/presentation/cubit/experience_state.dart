part of 'experience_cubit.dart';

abstract class ExperienceState extends Equatable {
  const ExperienceState();

  @override
  List<Object> get props => [];
}

class ExperienceInitial extends ExperienceState {}

class ExperienceLoading extends ExperienceState {}

class ExperienceLoaded extends ExperienceState {
  final List<ExperienceEntity> experienceList;

  const ExperienceLoaded({required this.experienceList});

  @override
  List<Object> get props => [experienceList];
}

class ExperienceError extends ExperienceState {
  final String message;

  const ExperienceError({required this.message});

  @override
  List<Object> get props => [message];
}
