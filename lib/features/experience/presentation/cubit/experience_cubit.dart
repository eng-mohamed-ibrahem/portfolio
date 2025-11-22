import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:portfolio/core/usecases/usecase.dart';
import 'package:portfolio/features/experience/domain/entities/experience_entity.dart';
import 'package:portfolio/features/experience/domain/usecases/get_experience.dart';

part 'experience_state.dart';

class ExperienceCubit extends Cubit<ExperienceState> {
  final GetExperience getExperience;

  ExperienceCubit({required this.getExperience}) : super(ExperienceInitial());

  Future<void> fetchExperience() async {
    emit(ExperienceLoading());
    final failureOrExperience = await getExperience(NoParams());
    failureOrExperience.fold(
      (failure) => emit(ExperienceError(message: failure.message)),
      (experience) => emit(ExperienceLoaded(experienceList: experience)),
    );
  }
}
