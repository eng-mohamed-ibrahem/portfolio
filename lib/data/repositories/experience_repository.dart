import 'package:dartz/dartz.dart';
import 'package:portfolio_app/core/error/failures.dart';
import 'package:portfolio_app/models/experience_model.dart';

import '../datasources/remote/experience_remote_datasource.dart';

abstract class ExperienceRepository {
  Future<Either<Failure, List<ExperienceModel>>> getExperiences();
  Future<Either<Failure, ExperienceModel>> getExperienceById(String id);
}

class ExperienceRepositoryImpl implements ExperienceRepository {
  final ExperienceRemoteDataSource _remoteDataSource;

  ExperienceRepositoryImpl({
    required ExperienceRemoteDataSource remoteDataSource,
  }) : _remoteDataSource = remoteDataSource;

  @override
  Future<Either<Failure, List<ExperienceModel>>> getExperiences() async {
    try {
      final experiences = await _remoteDataSource.getExperiences();
      return Right(experiences);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ExperienceModel>> getExperienceById(String id) async {
    try {
      final experience = await _remoteDataSource.getExperienceById(id);
      if (experience != null) {
        return Right(experience);
      } else {
        return const Left(ServerFailure('Experience not found'));
      }
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
