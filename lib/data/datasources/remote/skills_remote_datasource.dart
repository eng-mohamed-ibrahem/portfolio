import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:portfolio_app/models/skill_model.dart';

abstract class SkillsRemoteDataSource {
  Future<List<SkillModel>> getTechnicalSkills();
  Future<List<String>> getSoftSkills();
}

class SkillsRemoteDataSourceImpl implements SkillsRemoteDataSource {
  final FirebaseFirestore _firestore;

  SkillsRemoteDataSourceImpl({FirebaseFirestore? firestore})
    : _firestore = firestore ?? FirebaseFirestore.instance;

  @override
  Future<List<SkillModel>> getTechnicalSkills() async {
    try {
      final doc = await _firestore.collection('skills').get();
      if (doc.docs.isNotEmpty) {
        final data = doc.docs.map((e) => e.data()).toList();
        return (data as List).map((e) => SkillModel.fromJson(e)).toList();
      }
      return [];
    } catch (e) {
      throw Exception('Failed to fetch technical skills: $e');
    }
  }

  @override
  Future<List<String>> getSoftSkills() async {
    try {
      final doc = await _firestore.collection('soft_skills').get();
      if (doc.docs.isNotEmpty) {
        final data = doc.docs.map((e) => e.data()).toList();
        return (data as List).map((e) => e['name'] as String).toList();
      }
      return [];
    } catch (e) {
      throw Exception('Failed to fetch soft skills: $e');
    }
  }
}
