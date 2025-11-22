import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:portfolio/features/skills/data/models/skill_model.dart';

abstract class SkillRemoteDataSource {
  Future<List<SkillModel>> getSkills();
}

class SkillRemoteDataSourceImpl implements SkillRemoteDataSource {
  @override
  Future<List<SkillModel>> getSkills() async {
    final skills = await FirebaseFirestore.instance.collection('skills').get();
    return skills.docs.map((e) => SkillModel.fromJson(e.data())).toList();
  }
}
