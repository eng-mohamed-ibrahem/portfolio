import 'package:portfolio/features/works/domain/entities/work_entity.dart';

class WorkModel extends WorkEntity {
  const WorkModel({
    required super.title,
    required super.company,
    required super.duration,
    required super.description,
  });

  factory WorkModel.fromJson(Map<String, dynamic> json) {
    return WorkModel(
      title: json['title'],
      company: json['company'],
      duration: json['duration'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'company': company,
      'duration': duration,
      'description': description,
    };
  }
}
