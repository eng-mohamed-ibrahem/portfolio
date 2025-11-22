import 'package:dartz/dartz.dart';
import 'package:portfolio/core/error/failures.dart';
import 'package:portfolio/features/resume/data/datasources/resume_remote_data_source.dart';
import 'package:portfolio/features/resume/domain/entities/resume_entity.dart';
import 'package:portfolio/features/resume/domain/repositories/resume_repository.dart';

class ResumeRepositoryImpl implements ResumeRepository {
  final ResumeRemoteDataSource remoteDataSource;

  ResumeRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, ResumeEntity>> getResumeUrl() async {
    try {
      final resume = await remoteDataSource.getResumeUrl();
      return Right(resume);
    } catch (e) {
      return const Left(ServerFailure('Server Error'));
    }
  }
}
