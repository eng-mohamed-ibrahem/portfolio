import 'package:equatable/equatable.dart';

class ProjectEntity extends Equatable {
  final String title;
  final String description;
  final String imageUrl;
  final String projectUrl;

  const ProjectEntity({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.projectUrl,
  });

  @override
  List<Object?> get props => [title, description, imageUrl, projectUrl];
}
