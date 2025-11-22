import 'package:portfolio/features/experience/domain/entities/experience_entity.dart';

class ExperienceModel extends ExperienceEntity {
  const ExperienceModel({
    required super.companyLogoUrl,
    required super.companyName,
    required super.companyType,
    required super.createdAt,
    required super.descriptionInPoints,
    super.endDate,
    required super.jobTitle,
    required super.startDate,
  });

  factory ExperienceModel.fromJson(Map<String, dynamic> json) {
    return ExperienceModel(
      companyLogoUrl: json['companyLogoUrl'],
      companyName: json['companyName'],
      companyType: json['companyType'],
      createdAt: DateTime.parse(json['createdAt']),
      descriptionInPoints: List<String>.from(json['descriptionInPoints']),
      endDate: json['endDate'],
      jobTitle: json['jobTitle'],
      startDate: json['startDate'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'companyLogoUrl': companyLogoUrl,
      'companyName': companyName,
      'companyType': companyType,
      'createdAt': createdAt.toIso8601String(),
      'descriptionInPoints': descriptionInPoints,
      'endDate': endDate,
      'jobTitle': jobTitle,
      'startDate': startDate,
    };
  }
}
