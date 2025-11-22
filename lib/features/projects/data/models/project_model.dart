import 'package:portfolio/features/projects/domain/entities/project_entity.dart';

class ProjectModel extends ProjectEntity {
  const ProjectModel({
    required super.title,
    required super.description,
    required super.imageUrl,
    required super.projectUrl,
  });

  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    return ProjectModel(
      title: json['title'],
      description: json['description'],
      imageUrl: json['imageUrl'],
      projectUrl: json['projectUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'imageUrl': imageUrl,
      'projectUrl': projectUrl,
    };
  }
}
