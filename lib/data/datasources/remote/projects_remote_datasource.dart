import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:portfolio_app/models/project_model.dart';

abstract class ProjectsRemoteDataSource {
  Future<List<ProjectModel>> getProjects();
  Future<ProjectModel?> getProjectById(String id);
  Future<List<ProjectModel>> getProjectsByTechnology(String technology);
}

class ProjectsRemoteDataSourceImpl implements ProjectsRemoteDataSource {
  final FirebaseFirestore _firestore;

  ProjectsRemoteDataSourceImpl({FirebaseFirestore? firestore})
    : _firestore = firestore ?? FirebaseFirestore.instance;

  CollectionReference<Map<String, dynamic>> get _collection =>
      _firestore.collection('projects');

  @override
  Future<List<ProjectModel>> getProjects() async {
    try {
      final snapshot = await _collection
          .orderBy('createdAt', descending: true)
          .get();
      final projects = snapshot.docs.map((doc) {
        final data = doc.data();
        return ProjectModel.fromJson(data);
      }).toList();
      projects.sort((a, b) => b.createdAt.compareTo(a.createdAt));
      return projects;
    } catch (e) {
      throw Exception('Failed to fetch projects: $e');
    }
  }

  @override
  Future<ProjectModel?> getProjectById(String id) async {
    try {
      final doc = await _collection.doc(id).get();
      if (!doc.exists) return null;
      final data = doc.data()!;
      return ProjectModel.fromJson(data);
    } catch (e) {
      throw Exception('Failed to fetch project: $e');
    }
  }

  @override
  Future<List<ProjectModel>> getProjectsByTechnology(String technology) async {
    try {
      final snapshot = await _collection
          .where('technologies', arrayContains: technology)
          .orderBy('createdAt', descending: true)
          .get();
      final projects = snapshot.docs.map((doc) {
        final data = doc.data();
        return ProjectModel.fromJson(data);
      }).toList();
      projects.sort((a, b) => b.createdAt.compareTo(a.createdAt));
      return projects;
    } catch (e) {
      throw Exception('Failed to fetch projects by technology: $e');
    }
  }
}
