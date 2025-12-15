import 'package:dartz/dartz.dart';
import 'package:portfolio_app/core/error/failures.dart';
import 'package:portfolio_app/models/about_model.dart';

import '../datasources/remote/about_remote_datasource.dart';

abstract class AboutRepository {
  Future<Either<Failure, AboutModel>> getAbout();
}

class AboutRepositoryImpl implements AboutRepository {
  final AboutRemoteDataSource _remoteDataSource;

  AboutRepositoryImpl({required AboutRemoteDataSource remoteDataSource})
    : _remoteDataSource = remoteDataSource;

  @override
  Future<Either<Failure, AboutModel>> getAbout() async {
    try {
      final about = await _remoteDataSource.getAbout();
      return Right(about);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
