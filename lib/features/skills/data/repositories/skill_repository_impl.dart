import 'package:dartz/dartz.dart';
import 'package:portfolio/core/error/failures.dart';
import 'package:portfolio/features/skills/data/datasources/skill_remote_data_source.dart';
import 'package:portfolio/features/skills/domain/entities/skill_entity.dart';
import 'package:portfolio/features/skills/domain/repositories/skill_repository.dart';

class SkillRepositoryImpl implements SkillRepository {
  final SkillRemoteDataSource remoteDataSource;

  SkillRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<SkillEntity>>> getSkills() async {
    try {
      final skills = await remoteDataSource.getSkills();
      return Right(skills);
    } catch (e) {
      return const Left(ServerFailure('Server Error'));
    }
  }
}
