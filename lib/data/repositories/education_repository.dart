import 'package:dartz/dartz.dart';
import 'package:portfolio_app/core/error/failures.dart';
import 'package:portfolio_app/models/education_model.dart';

import '../datasources/remote/education_remote_datasource.dart';

abstract class EducationRepository {
  Future<Either<Failure, List<EducationModel>>> getEducation();
}

class EducationRepositoryImpl implements EducationRepository {
  final EducationRemoteDataSource _remoteDataSource;

  EducationRepositoryImpl({required EducationRemoteDataSource remoteDataSource})
    : _remoteDataSource = remoteDataSource;

  @override
  Future<Either<Failure, List<EducationModel>>> getEducation() async {
    try {
      final education = await _remoteDataSource.getEducation();
      return Right(education);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
