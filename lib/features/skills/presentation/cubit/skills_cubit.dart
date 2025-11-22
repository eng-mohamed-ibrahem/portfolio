import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:portfolio/core/usecases/usecase.dart';
import 'package:portfolio/features/skills/domain/entities/skill_entity.dart';
import 'package:portfolio/features/skills/domain/usecases/get_skills.dart';

part 'skills_state.dart';

class SkillsCubit extends Cubit<SkillsState> {
  final GetSkills getSkills;

  SkillsCubit({required this.getSkills}) : super(SkillsInitial());

  Future<void> fetchSkills() async {
    emit(SkillsLoading());
    final failureOrSkills = await getSkills(NoParams());
    failureOrSkills.fold(
      (failure) => emit(SkillsError(message: failure.message)),
      (skills) => emit(SkillsLoaded(skills: skills)),
    );
  }
}
