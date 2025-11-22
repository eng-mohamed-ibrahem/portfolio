part of 'resume_cubit.dart';

abstract class ResumeState extends Equatable {
  const ResumeState();

  @override
  List<Object> get props => [];
}

class ResumeInitial extends ResumeState {}

class ResumeLoading extends ResumeState {}

class ResumeLoaded extends ResumeState {
  final ResumeEntity resume;

  const ResumeLoaded({required this.resume});

  @override
  List<Object> get props => [resume];
}

class ResumeError extends ResumeState {
  final String message;

  const ResumeError({required this.message});

  @override
  List<Object> get props => [message];
}
