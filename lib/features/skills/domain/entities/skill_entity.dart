import 'package:equatable/equatable.dart';

/// Represents a skill entity with its proficiency level and metadata.
class SkillEntity extends Equatable {
  /// The date and time when the skill was created/recorded.
  final DateTime createdAt;

  /// The proficiency level of the skill (e.g., 'Beginner', 'Intermediate', 'Advanced').
  final String level;

  /// The name of the skill.
  final String name;

  /// The proficiency percentage (0-100) of the skill.
  final double percent;

  /// Creates a [SkillEntity] with the given parameters.
  ///
  /// Throws [ArgumentError] if:
  /// - [name] is empty
  /// - [level] is empty
  /// - [percent] is not between 0 and 100
  SkillEntity({
    required this.createdAt,
    required this.level,
    required this.name,
    required this.percent,
  })  : assert(name.isNotEmpty, 'Name cannot be empty'),
        assert(level.isNotEmpty, 'Level cannot be empty'),
        assert(percent >= 0 && percent <= 100,
            'Percent must be between 0 and 100');

  /// Creates a copy of this skill with the given fields replaced by the non-null values.
  SkillEntity copyWith({
    DateTime? createdAt,
    String? level,
    String? name,
    double? percent,
  }) {
    return SkillEntity(
      createdAt: createdAt ?? this.createdAt,
      level: level ?? this.level,
      name: name ?? this.name,
      percent: percent ?? this.percent,
    );
  }

  @override
  List<Object?> get props => [createdAt, level, name, percent];

  @override
  String toString() =>
      'SkillEntity(name: $name, level: $level, percent: $percent%)';
}
