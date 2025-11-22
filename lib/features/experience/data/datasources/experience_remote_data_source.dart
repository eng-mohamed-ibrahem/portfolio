import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:portfolio/features/experience/data/models/experience_model.dart';

abstract class ExperienceRemoteDataSource {
  Future<List<ExperienceModel>> getExperience();
}

class ExperienceRemoteDataSourceImpl implements ExperienceRemoteDataSource {
  @override
  Future<List<ExperienceModel>> getExperience() async {
    try {
      final experiences =
          await FirebaseFirestore.instance.collection('experience').get();
      return experiences.docs
          .map((doc) => ExperienceModel.fromJson(doc.data()))
          .toList();
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
