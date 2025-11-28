import 'package:equatable/equatable.dart';

class ProjectEntity extends Equatable {
  final String appStoreUrl;
  final DateTime createdAt;
  final String description;
  final String downloadUrl;
  final String githubUrl;
  final String googlePlayUrl;
  final String imageUrl;
  final String name;
  final String promoUrl;

  const ProjectEntity({
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

  @override
  List<Object?> get props => [
        appStoreUrl,
        createdAt,
        description,
        downloadUrl,
        githubUrl,
        googlePlayUrl,
        imageUrl,
        name,
        promoUrl,
      ];
}
