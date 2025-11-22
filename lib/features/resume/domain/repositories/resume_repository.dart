import 'package:dartz/dartz.dart';
import 'package:portfolio/core/error/failures.dart';
import 'package:portfolio/features/resume/domain/entities/resume_entity.dart';

abstract class ResumeRepository {
  Future<Either<Failure, ResumeEntity>> getResumeUrl();
}
