import 'package:dartz/dartz.dart';
import 'package:portfolio/core/error/failures.dart';
import 'package:portfolio/core/usecases/usecase.dart';
import 'package:portfolio/features/works/domain/entities/work_entity.dart';
import 'package:portfolio/features/works/domain/repositories/work_repository.dart';

class GetWorks implements UseCase<List<WorkEntity>, NoParams> {
  final WorkRepository repository;

  GetWorks(this.repository);

  @override
  Future<Either<Failure, List<WorkEntity>>> call(NoParams params) async {
    return await repository.getWorks();
  }
}
