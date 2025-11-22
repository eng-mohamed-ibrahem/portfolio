import 'package:dartz/dartz.dart';
import 'package:portfolio/core/error/failures.dart';
import 'package:portfolio/features/experience/data/datasources/experience_remote_data_source.dart';
import 'package:portfolio/features/experience/domain/entities/experience_entity.dart';
import 'package:portfolio/features/experience/domain/repositories/experience_repository.dart';

class ExperienceRepositoryImpl implements ExperienceRepository {
  final ExperienceRemoteDataSource remoteDataSource;

  ExperienceRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<ExperienceEntity>>> getExperience() async {
    try {
      final experienceList = await remoteDataSource.getExperience();
      return Right(experienceList);
    } catch (e) {
      return const Left(ServerFailure('Server Error'));
    }
  }
}
