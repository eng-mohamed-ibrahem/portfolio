import 'package:dartz/dartz.dart';
import 'package:portfolio/core/error/failures.dart';
import 'package:portfolio/features/works/data/datasources/work_remote_data_source.dart';
import 'package:portfolio/features/works/domain/entities/work_entity.dart';
import 'package:portfolio/features/works/domain/repositories/work_repository.dart';

class WorkRepositoryImpl implements WorkRepository {
  final WorkRemoteDataSource remoteDataSource;

  WorkRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<WorkEntity>>> getWorks() async {
    try {
      final works = await remoteDataSource.getWorks();
      return Right(works);
    } catch (e) {
      return const Left(ServerFailure('Server Error'));
    }
  }
}
