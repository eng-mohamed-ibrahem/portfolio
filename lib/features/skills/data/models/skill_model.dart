import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:portfolio/features/skills/domain/entities/skill_entity.dart';

class SkillModel extends SkillEntity {
  SkillModel({
    required super.createdAt,
    required super.level,
    required super.name,
    required super.percent,
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
