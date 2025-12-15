import 'package:cloud_firestore/cloud_firestore.dart';

class ExperienceModel {
  const ExperienceModel({
    required this.companyLogoUrl,
    required this.companyName,
    required this.companyType,
    required this.createdAt,
    required this.descriptionInPoints,
    this.endDate,
    required this.jobTitle,
    required this.startDate,
  });

  final String companyLogoUrl;
  final String companyName;
  final String companyType;
  final DateTime createdAt;
  final List<String> descriptionInPoints;
  final DateTime? endDate;
  final String jobTitle;
  final DateTime startDate;

  factory ExperienceModel.fromJson(Map<String, dynamic> json) {
    return ExperienceModel(
      companyLogoUrl: json['companyLogoUrl'],
      companyName: json['companyName'],
      companyType: json['companyType'],
      createdAt: (json['createdAt'] as Timestamp).toDate(),
      descriptionInPoints: List<String>.from(json['descriptionInPoints']),
      endDate: _parseDate(json['endDate']),
      jobTitle: json['jobTitle'],
      startDate: _parseDate(json['startDate']) ?? DateTime.now(),
    );
  }

  /// Helper method to parse date fields that can be either Timestamp or String
  static DateTime? _parseDate(dynamic value) {
    if (value == null) return null;

    // If it's already a Timestamp, convert it
    if (value is Timestamp) {
      return value.toDate();
    }

    // If it's a String (like "Present", "Current", etc.), return null
    // This indicates an ongoing position
    if (value is String) {
      return null;
    }

    // If it's already a DateTime, return it
    if (value is DateTime) {
      return value;
    }

    return null;
  }

  Map<String, dynamic> toJson() {
    return {
      'companyLogoUrl': companyLogoUrl,
      'companyName': companyName,
      'companyType': companyType,
      'createdAt': Timestamp.fromDate(createdAt),
      'descriptionInPoints': descriptionInPoints,
      'endDate': endDate,
      'jobTitle': jobTitle,
      'startDate': startDate,
    };
  }
}
