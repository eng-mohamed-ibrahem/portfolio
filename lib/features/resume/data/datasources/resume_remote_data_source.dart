import 'package:portfolio/features/resume/data/models/resume_model.dart';

abstract class ResumeRemoteDataSource {
  Future<ResumeModel> getResumeUrl();
}

class ResumeRemoteDataSourceImpl implements ResumeRemoteDataSource {
  @override
  Future<ResumeModel> getResumeUrl() async {
    // TODO: Implement Firebase logic
    return Future.value(const ResumeModel(url: 'https://example.com/resume.pdf'));
  }
}
