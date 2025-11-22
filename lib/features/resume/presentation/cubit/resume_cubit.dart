import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:portfolio/core/usecases/usecase.dart';
import 'package:portfolio/features/resume/domain/entities/resume_entity.dart';
import 'package:portfolio/features/resume/domain/usecases/get_resume_url.dart';

part 'resume_state.dart';

class ResumeCubit extends Cubit<ResumeState> {
  final GetResumeUrl getResumeUrl;

  ResumeCubit({required this.getResumeUrl}) : super(ResumeInitial());

  Future<void> fetchResumeUrl() async {
    emit(ResumeLoading());
    final failureOrResume = await getResumeUrl(NoParams());
    failureOrResume.fold(
      (failure) => emit(ResumeError(message: failure.message)),
      (resume) => emit(ResumeLoaded(resume: resume)),
    );
  }
}
