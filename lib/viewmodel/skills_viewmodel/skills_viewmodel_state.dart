part of 'skills_viewmodel.dart';

abstract class SkillsViewModelState {}

class SkillsViewModelInitial extends SkillsViewModelState {}

class SkillsViewModelLoading extends SkillsViewModelState {}

class SkillsViewModelSuccess extends SkillsViewModelState {}

class SkillsViewModelError extends SkillsViewModelState {}

class SelectedSkill extends SkillsViewModelState {
  final SkillModel? skill;
  SelectedSkill(this.skill);
}
