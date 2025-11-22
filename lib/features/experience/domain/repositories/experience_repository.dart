import 'package:dartz/dartz.dart';
import 'package:portfolio/core/error/failures.dart';
import 'package:portfolio/features/experience/domain/entities/experience_entity.dart';

abstract class ExperienceRepository {
  Future<Either<Failure, List<ExperienceEntity>>> getExperience();
}
