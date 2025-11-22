import 'package:get_it/get_it.dart';
import 'package:portfolio/core/utils/runtime_cache/runtime_cache.dart';
import 'package:portfolio/features/home/data/datasources/home_remote_data_source.dart';
import 'package:portfolio/features/home/data/repositories/home_repository_impl.dart';
import 'package:portfolio/features/home/domain/repositories/home_repository.dart';
import 'package:portfolio/features/home/domain/usecases/get_home_data.dart';
import 'package:portfolio/features/home/presentation/cubit/home_cubit.dart';
import 'package:portfolio/features/experience/data/datasources/experience_remote_data_source.dart';
import 'package:portfolio/features/experience/data/repositories/experience_repository_impl.dart';
import 'package:portfolio/features/experience/domain/repositories/experience_repository.dart';
import 'package:portfolio/features/experience/domain/usecases/get_experience.dart';
import 'package:portfolio/features/experience/presentation/cubit/experience_cubit.dart';
import 'package:portfolio/features/projects/data/datasources/project_remote_data_source.dart';
import 'package:portfolio/features/projects/data/repositories/project_repository_impl.dart';
import 'package:portfolio/features/projects/domain/repositories/project_repository.dart';
import 'package:portfolio/features/projects/domain/usecases/get_projects.dart';
import 'package:portfolio/features/projects/presentation/cubit/projects_cubit.dart';
import 'package:portfolio/features/skills/data/datasources/skill_remote_data_source.dart';
import 'package:portfolio/features/skills/data/repositories/skill_repository_impl.dart';
import 'package:portfolio/features/skills/domain/repositories/skill_repository.dart';
import 'package:portfolio/features/skills/domain/usecases/get_skills.dart';
import 'package:portfolio/features/skills/presentation/cubit/skills_cubit.dart';
import 'package:portfolio/features/works/data/datasources/work_remote_data_source.dart';
import 'package:portfolio/features/works/data/repositories/work_repository_impl.dart';
import 'package:portfolio/features/works/domain/repositories/work_repository.dart';
import 'package:portfolio/features/works/domain/usecases/get_works.dart';
import 'package:portfolio/features/works/presentation/cubit/works_cubit.dart';
import 'package:portfolio/features/resume/data/datasources/resume_remote_data_source.dart';
import 'package:portfolio/features/resume/data/repositories/resume_repository_impl.dart';
import 'package:portfolio/features/resume/domain/repositories/resume_repository.dart';
import 'package:portfolio/features/resume/domain/usecases/get_resume_url.dart';
import 'package:portfolio/features/resume/presentation/cubit/resume_cubit.dart';

GetIt _getIt = GetIt.instance;

void setUpDepdencies() {
  _getIt.registerSingleton(RuntimeCache.instance());

  // Home Feature
  _getIt.registerLazySingleton<HomeRemoteDataSource>(
      () => HomeRemoteDataSourceImpl());
  _getIt.registerLazySingleton<HomeRepository>(
      () => HomeRepositoryImpl(remoteDataSource: _getIt()));
  _getIt.registerLazySingleton(() => GetHomeData(_getIt()));
  _getIt.registerFactory(() => HomeCubit(getHomeData: _getIt()));

  // Experience Feature
  _getIt.registerLazySingleton<ExperienceRemoteDataSource>(
      () => ExperienceRemoteDataSourceImpl());
  _getIt.registerLazySingleton<ExperienceRepository>(
      () => ExperienceRepositoryImpl(remoteDataSource: _getIt()));
  _getIt.registerLazySingleton(() => GetExperience(_getIt()));
  _getIt.registerFactory(() => ExperienceCubit(getExperience: _getIt()));

  // Projects Feature
  _getIt.registerLazySingleton<ProjectRemoteDataSource>(
      () => ProjectRemoteDataSourceImpl());
  _getIt.registerLazySingleton<ProjectRepository>(
      () => ProjectRepositoryImpl(remoteDataSource: _getIt()));
  _getIt.registerLazySingleton(() => GetProjects(_getIt()));
  _getIt.registerFactory(() => ProjectsCubit(getProjects: _getIt()));

  // Skills Feature
  _getIt.registerLazySingleton<SkillRemoteDataSource>(
      () => SkillRemoteDataSourceImpl());
  _getIt.registerLazySingleton<SkillRepository>(
      () => SkillRepositoryImpl(remoteDataSource: _getIt()));
  _getIt.registerLazySingleton(() => GetSkills(_getIt()));
  _getIt.registerFactory(() => SkillsCubit(getSkills: _getIt()));

  // Works Feature
  _getIt.registerLazySingleton<WorkRemoteDataSource>(
      () => WorkRemoteDataSourceImpl());
  _getIt.registerLazySingleton<WorkRepository>(
      () => WorkRepositoryImpl(remoteDataSource: _getIt()));
  _getIt.registerLazySingleton(() => GetWorks(_getIt()));
  _getIt.registerFactory(() => WorksCubit(getWorks: _getIt()));

  // Resume Feature
  _getIt.registerLazySingleton<ResumeRemoteDataSource>(
      () => ResumeRemoteDataSourceImpl());
  _getIt.registerLazySingleton<ResumeRepository>(
      () => ResumeRepositoryImpl(remoteDataSource: _getIt()));
  _getIt.registerLazySingleton(() => GetResumeUrl(_getIt()));
  _getIt.registerFactory(() => ResumeCubit(getResumeUrl: _getIt()));
}
