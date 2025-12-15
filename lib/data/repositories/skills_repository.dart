import 'package:dartz/dartz.dart';
import 'package:portfolio_app/core/error/failures.dart';
import 'package:portfolio_app/models/skill_model.dart';

import '../datasources/remote/skills_remote_datasource.dart';

abstract class SkillsRepository {
  Future<Either<Failure, List<SkillModel>>> getTechnicalSkills();
  Future<Either<Failure, List<String>>> getSoftSkills();
}

class SkillsRepositoryImpl implements SkillsRepository {
  final SkillsRemoteDataSource _remoteDataSource;

  SkillsRepositoryImpl({required SkillsRemoteDataSource remoteDataSource})
    : _remoteDataSource = remoteDataSource;

  @override
  Future<Either<Failure, List<SkillModel>>> getTechnicalSkills() async {
    try {
      final skills = await _remoteDataSource.getTechnicalSkills();
      return Right(skills);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<String>>> getSoftSkills() async {
    try {
      final skills = await _remoteDataSource.getSoftSkills();
      return Right(skills);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
