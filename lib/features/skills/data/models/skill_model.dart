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
      createdAt: DateTime.parse(json['createdAt']),
      level: json['level'],
      name: json['name'],
      percent: (json['percent'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'createdAt': createdAt.toIso8601String(),
      'level': level,
      'name': name,
      'percent': percent,
    };
  }
}
