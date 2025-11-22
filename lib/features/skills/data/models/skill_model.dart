import 'package:portfolio/features/skills/domain/entities/skill_entity.dart';

class SkillModel extends SkillEntity {
  const SkillModel({
    required super.name,
    required super.percentage,
  });

  factory SkillModel.fromJson(Map<String, dynamic> json) {
    return SkillModel(
      name: json['name'],
      percentage: json['percentage'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'percentage': percentage,
    };
  }
}
