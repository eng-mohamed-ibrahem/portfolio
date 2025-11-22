import 'package:dartz/dartz.dart';
import 'package:portfolio/core/error/failures.dart';
import 'package:portfolio/features/works/domain/entities/work_entity.dart';

abstract class WorkRepository {
  Future<Either<Failure, List<WorkEntity>>> getWorks();
}
