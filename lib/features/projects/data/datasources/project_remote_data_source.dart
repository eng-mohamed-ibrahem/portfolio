import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:portfolio/features/projects/data/models/project_model.dart';

abstract class ProjectRemoteDataSource {
  Future<List<ProjectModel>> getProjects();
}

class ProjectRemoteDataSourceImpl implements ProjectRemoteDataSource {
  @override
  Future<List<ProjectModel>> getProjects() async {
    final projects = await FirebaseFirestore.instance.collection('projects').get();
    return projects.docs.map((doc) => ProjectModel.fromJson(doc.data())).toList();
  }
}
