import 'package:dartz/dartz.dart';
import 'package:portfolio_app/core/error/failures.dart';
import 'package:portfolio_app/data/datasources/remote/projects_remote_datasource.dart';
import 'package:portfolio_app/models/project_model.dart';

abstract class ProjectsRepository {
  Future<Either<Failure, List<ProjectModel>>> getProjects();
  Future<Either<Failure, ProjectModel>> getProjectById(String id);
  Future<Either<Failure, List<ProjectModel>>> getProjectsByTechnology(
    String technology,
  );
}

class ProjectsRepositoryImpl implements ProjectsRepository {
  final ProjectsRemoteDataSource _remoteDataSource;

  ProjectsRepositoryImpl({required ProjectsRemoteDataSource remoteDataSource})
    : _remoteDataSource = remoteDataSource;

  @override
  Future<Either<Failure, List<ProjectModel>>> getProjects() async {
    try {
      final projectModels = await _remoteDataSource.getProjects();
      return Right(projectModels);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ProjectModel>> getProjectById(String id) async {
    try {
      final projectModel = await _remoteDataSource.getProjectById(id);
      if (projectModel != null) {
        return Right(projectModel);
      } else {
        return const Left(ServerFailure('Project not found'));
      }
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ProjectModel>>> getProjectsByTechnology(
    String technology,
  ) async {
    try {
      final projectModels = await _remoteDataSource.getProjectsByTechnology(
        technology,
      );
      return Right(projectModels);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
