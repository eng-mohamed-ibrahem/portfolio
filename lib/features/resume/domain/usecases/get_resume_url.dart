import 'package:dartz/dartz.dart';
import 'package:portfolio/core/error/failures.dart';
import 'package:portfolio/core/usecases/usecase.dart';
import 'package:portfolio/features/resume/domain/entities/resume_entity.dart';
import 'package:portfolio/features/resume/domain/repositories/resume_repository.dart';

class GetResumeUrl implements UseCase<ResumeEntity, NoParams> {
  final ResumeRepository repository;

  GetResumeUrl(this.repository);

  @override
  Future<Either<Failure, ResumeEntity>> call(NoParams params) async {
    return await repository.getResumeUrl();
  }
}
