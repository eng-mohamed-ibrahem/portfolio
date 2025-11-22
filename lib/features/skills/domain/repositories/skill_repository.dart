import 'package:dartz/dartz.dart';
import 'package:portfolio/core/error/failures.dart';
import 'package:portfolio/features/skills/domain/entities/skill_entity.dart';

abstract class SkillRepository {
  Future<Either<Failure, List<SkillEntity>>> getSkills();
}
