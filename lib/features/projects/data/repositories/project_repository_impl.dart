import 'package:dartz/dartz.dart';
import 'package:portfolio/core/error/failures.dart';
import 'package:portfolio/features/projects/data/datasources/project_remote_data_source.dart';
import 'package:portfolio/features/projects/domain/entities/project_entity.dart';
import 'package:portfolio/features/projects/domain/repositories/project_repository.dart';

class ProjectRepositoryImpl implements ProjectRepository {
  final ProjectRemoteDataSource remoteDataSource;

  ProjectRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<ProjectEntity>>> getProjects() async {
    try {
      final projects = await remoteDataSource.getProjects();
      return Right(projects);
    } catch (e) {
      return const Left(ServerFailure('Server Error'));
    }
  }
}
