import 'package:portfolio/features/skills/data/models/skill_model.dart';

abstract class SkillRemoteDataSource {
  Future<List<SkillModel>> getSkills();
}

class SkillRemoteDataSourceImpl implements SkillRemoteDataSource {
  @override
  Future<List<SkillModel>> getSkills() async {
    // TODO: Implement Firebase logic
    return Future.value([
      const SkillModel(name: 'Flutter', percentage: 0.9),
      const SkillModel(name: 'Dart', percentage: 0.8),
      const SkillModel(name: 'Firebase', percentage: 0.7),
      const SkillModel(name: 'Git', percentage: 0.8),
    ]);
  }
}
