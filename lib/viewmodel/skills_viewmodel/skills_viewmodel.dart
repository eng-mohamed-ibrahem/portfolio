import 'package:flutter_bloc/flutter_bloc.dart';

part 'skills_viewmodel_state.dart';

class SkillsViewModel extends Cubit<SkillsViewModelState> {
  SkillsViewModel() : super(SkillsViewModelInitial());
  SkillModel? selectedSkill;

  void setSelectedSkill(
    SkillModel? skill, {
    bool isHover = false,
  }) {
    if (!isHover && selectedSkill == skill || skill == null) {
      selectedSkill = null;
    } else {
      selectedSkill = skill;
    }
    emit(SelectedSkill(selectedSkill));
  }

  final skills = [
    SkillModel(
      'Languages & Framework',
      [
        'Java',
        'Android',
        'Dart',
        'Flutter Framework',
      ],
    ),
    SkillModel(
      'Local Storage',
      [
        'SQFlite',
        'SharedPreferences',
        'Hive',
      ],
    ),
    SkillModel(
      'Flutter State Management',
      [
        'Riverpod',
        'BLoC',
        'Provider',
      ],
    ),
    SkillModel(
      'Flutter Skills',
      [
        'Responsive Design',
        'Adaptive Design',
        'Internationalization',
        'Theming',
        'Location',
        'Google Map',
        'Payment Gateway',
        'Socket IO',
        'Go_Router',
        "FVM"
      ],
    ),
    SkillModel(
      'Firebase',
      [
        'Firebase Auth',
        'Firebase Firestore',
        'Firebase Messaging (Notifications)',
        'Firebase Storage',
        'Firebase Analytics',
        'Firebase Hosting',
      ],
    ),
    SkillModel(
      'Software Development',
      [
        'OOP',
        'SOLID Principles',
        'Data Structure',
        'Problem Solving',
        'Algorithms',
        'Clean Code',
      ],
    ),
    SkillModel(
      'API Integration',
      [
        'RESTful API',
        'Json',
        'Http',
        'Dio',
      ],
    ),
    SkillModel(
      'Version Control',
      [
        'Git',
        'GitHub',
      ],
    ),
    SkillModel(
      'Architectural Patterns',
      [
        'MVC',
        'MVVM',
        'Clean Architecture',
      ],
    ),
  ];
}

class SkillModel {
  final String title;
  final List<String> subSkills;

  SkillModel(this.title, this.subSkills);
}
