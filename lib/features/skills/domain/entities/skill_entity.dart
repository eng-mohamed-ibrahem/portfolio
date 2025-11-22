import 'package:equatable/equatable.dart';

class SkillEntity extends Equatable {
  final String name;
  final double percentage;

  const SkillEntity({
    required this.name,
    required this.percentage,
  });

  @override
  List<Object?> get props => [name, percentage];
}
