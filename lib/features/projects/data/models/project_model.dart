import 'package:portfolio/features/projects/domain/entities/project_entity.dart';

class ProjectModel extends ProjectEntity {
  const ProjectModel({
    required super.appStoreUrl,
    required super.createdAt,
    required super.description,
    required super.downloadUrl,
    required super.githubUrl,
    required super.googlePlayUrl,
    required super.imageUrl,
    required super.name,
    required super.promoUrl,
  });

  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    return ProjectModel(
      appStoreUrl: json['appStoreUrl'] ?? '',
      createdAt: DateTime.parse(json['createdAt'] ?? ''),
      description: json['description'] ?? '',
      downloadUrl: json['downloadUrl'] ?? '',
      githubUrl: json['githubUrl'] ?? '',
      googlePlayUrl: json['googlePlayUrl'] ?? '',
      imageUrl: List<String>.from(json['imageUrl'] ?? []),
      name: json['name'] ?? '',
      promoUrl: json['promoUrl'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'appStoreUrl': appStoreUrl,
      'createdAt': createdAt.toIso8601String(),
      'description': description,
      'downloadUrl': downloadUrl,
      'githubUrl': githubUrl,
      'googlePlayUrl': googlePlayUrl,
      'imageUrl': imageUrl,
      'name': name,
      'promoUrl': promoUrl,
    };
  }
}
