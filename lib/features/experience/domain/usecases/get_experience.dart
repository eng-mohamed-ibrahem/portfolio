import 'package:dartz/dartz.dart';
import 'package:portfolio/core/error/failures.dart';
import 'package:portfolio/core/usecases/usecase.dart';
import 'package:portfolio/features/experience/domain/entities/experience_entity.dart';
import 'package:portfolio/features/experience/domain/repositories/experience_repository.dart';

class GetExperience implements UseCase<List<ExperienceEntity>, NoParams> {
  final ExperienceRepository repository;

  GetExperience(this.repository);

  @override
  Future<Either<Failure, List<ExperienceEntity>>> call(NoParams params) async {
    return await repository.getExperience();
  }
}
