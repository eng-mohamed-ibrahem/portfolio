import 'package:dartz/dartz.dart';
import 'package:portfolio/core/error/failures.dart';
import 'package:portfolio/features/home/data/datasources/home_remote_data_source.dart';
import 'package:portfolio/features/home/domain/entities/home_entity.dart';
import 'package:portfolio/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource remoteDataSource;

  HomeRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, HomeEntity>> getHomeData() async {
    try {
      final homeData = await remoteDataSource.getHomeData();
      return Right(homeData);
    } catch (e) {
      return const Left(ServerFailure('Server Error'));
    }
  }
}
