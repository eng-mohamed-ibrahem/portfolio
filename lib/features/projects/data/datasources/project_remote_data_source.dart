import 'package:portfolio/features/projects/data/models/project_model.dart';

abstract class ProjectRemoteDataSource {
  Future<List<ProjectModel>> getProjects();
}

class ProjectRemoteDataSourceImpl implements ProjectRemoteDataSource {
  @override
  Future<List<ProjectModel>> getProjects() async {
    // TODO: Implement Firebase logic
    return Future.value([
      const ProjectModel(
        title: 'Project 1',
        description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
        imageUrl: 'https://via.placeholder.com/150',
        projectUrl: 'https://example.com',
      ),
      const ProjectModel(
        title: 'Project 2',
        description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
        imageUrl: 'https://via.placeholder.com/150',
        projectUrl: 'https://example.com',
      ),
    ]);
  }
}
