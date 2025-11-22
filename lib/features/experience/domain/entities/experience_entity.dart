import 'package:equatable/equatable.dart';

class ExperienceEntity extends Equatable {
  final String companyLogoUrl;
  final String companyName;
  final String companyType;
  final DateTime createdAt;
  final List<String> descriptionInPoints;
  final String? endDate; // Nullable for current positions
  final String jobTitle;
  final String startDate;

  const ExperienceEntity({
    required this.companyLogoUrl,
    required this.companyName,
    required this.companyType,
    required this.createdAt,
    required this.descriptionInPoints,
    this.endDate,
    required this.jobTitle,
    required this.startDate,
  });

  @override
  List<Object?> get props => [
        companyLogoUrl,
        companyName,
        companyType,
        createdAt,
        descriptionInPoints,
        endDate,
        jobTitle,
        startDate,
      ];
}
