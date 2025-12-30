import 'package:cloud_firestore/cloud_firestore.dart';

class ProjectModel {
  const ProjectModel({
    required this.appStoreUrl,
    required this.createdAt,
    required this.description,
    required this.downloadUrl,
    required this.githubUrl,
    required this.googlePlayUrl,
    required this.imageUrl,
    required this.name,
    required this.promoUrl,
  });

  final String appStoreUrl;
  final DateTime createdAt;
  final String description;
  final String downloadUrl;
  final String githubUrl;
  final String googlePlayUrl;
  final String imageUrl;
  final String name;
  final String promoUrl;

  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    return ProjectModel(
      appStoreUrl: json['appStoreUrl'] ?? '',
      createdAt: json['createdAt'] != null
          ? (json['createdAt'] as Timestamp).toDate()
          : DateTime.now(),
      description: json['description'] ?? '',
      downloadUrl: json['downloadUrl'] ?? '',
      githubUrl: json['githubUrl'] ?? '',
      googlePlayUrl: json['googlePlayUrl'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      name: json['name'] ?? '',
      promoUrl: json['promoUrl'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'appStoreUrl': appStoreUrl,
      'createdAt': Timestamp.fromDate(createdAt),
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
