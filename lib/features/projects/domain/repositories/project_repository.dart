import 'package:dartz/dartz.dart';
import 'package:portfolio/core/error/failures.dart';
import 'package:portfolio/features/projects/domain/entities/project_entity.dart';

abstract class ProjectRepository {
  Future<Either<Failure, List<ProjectEntity>>> getProjects();
}
