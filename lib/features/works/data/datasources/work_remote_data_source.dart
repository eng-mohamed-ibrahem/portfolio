import 'package:portfolio/features/works/data/models/work_model.dart';

abstract class WorkRemoteDataSource {
  Future<List<WorkModel>> getWorks();
}

class WorkRemoteDataSourceImpl implements WorkRemoteDataSource {
  @override
  Future<List<WorkModel>> getWorks() async {
    // TODO: Implement Firebase logic
    return Future.value([
      const WorkModel(
        title: 'Software Engineer',
        company: 'Google',
        duration: '2023 - Present',
        description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      ),
      const WorkModel(
        title: 'Software Engineer Intern',
        company: 'Facebook',
        duration: '2022 - 2023',
        description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      ),
    ]);
  }
}
