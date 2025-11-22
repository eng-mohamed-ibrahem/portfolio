import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:portfolio/features/resume/data/models/resume_model.dart';

abstract class ResumeRemoteDataSource {
  Future<ResumeModel> getResumeUrl();
}

class ResumeRemoteDataSourceImpl implements ResumeRemoteDataSource {
  @override
  Future<ResumeModel> getResumeUrl() async {
    final snapshot = await FirebaseFirestore.instance.collection('profile').doc('resume').get();
    final resumeData = snapshot.data();
    return ResumeModel.fromJson(resumeData!);
  }
}
