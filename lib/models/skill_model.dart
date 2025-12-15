import 'package:cloud_firestore/cloud_firestore.dart';

class SkillModel {
  final DateTime createdAt;
  final String level;
  final String name;
  final double percent;

  SkillModel({
    required this.createdAt,
    required this.level,
    required this.name,
    required this.percent,
  });

  factory SkillModel.fromJson(Map<String, dynamic> json) {
    return SkillModel(
      createdAt: (json['createdAt'] as Timestamp).toDate(),
      level: json['level'],
      name: json['name'],
      percent: (json['percent'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'createdAt': Timestamp.fromDate(createdAt),
      'level': level,
      'name': name,
      'percent': percent,
    };
  }
}
