import 'package:dartz/dartz.dart';
import 'package:portfolio/core/error/failures.dart';
import 'package:portfolio/core/usecases/usecase.dart';
import 'package:portfolio/features/projects/domain/entities/project_entity.dart';
import 'package:portfolio/features/projects/domain/repositories/project_repository.dart';

class GetProjects implements UseCase<List<ProjectEntity>, NoParams> {
  final ProjectRepository repository;

  GetProjects(this.repository);

  @override
  Future<Either<Failure, List<ProjectEntity>>> call(NoParams params) async {
    return await repository.getProjects();
  }
}
