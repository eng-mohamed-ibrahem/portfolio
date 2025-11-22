import 'package:portfolio/features/experience/data/models/experience_model.dart';

abstract class ExperienceRemoteDataSource {
  Future<List<ExperienceModel>> getExperience();
}

class ExperienceRemoteDataSourceImpl implements ExperienceRemoteDataSource {
  @override
  Future<List<ExperienceModel>> getExperience() async {
    // TODO: Implement Firebase logic
    return Future.value([
      const ExperienceModel(
        title: 'Flutter Developer',
        company: 'Company A',
        duration: '2022 - Present',
        description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      ),
      const ExperienceModel(
        title: 'Junior Flutter Developer',
        company: 'Company B',
        duration: '2021 - 2022',
        description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      ),
    ]);
  }
}
