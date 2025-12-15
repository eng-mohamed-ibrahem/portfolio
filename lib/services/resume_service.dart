import 'package:dartz/dartz.dart';
import 'package:portfolio_app/models/about_model.dart';
import 'package:portfolio_app/models/contact_model.dart';
import 'package:portfolio_app/models/education_model.dart';
import 'package:portfolio_app/models/experience_model.dart';
import 'package:portfolio_app/models/project_model.dart';
import 'package:portfolio_app/models/resume_model.dart';
import 'package:portfolio_app/models/skill_model.dart';

import '../core/error/failures.dart';
import '../data/data.dart';

class ResumeService {
  final AboutRepository _aboutRepository;
  final ContactRepository _contactRepository;
  final EducationRepository _educationRepository;
  final ExperienceRepository _experienceRepository;
  final ProjectsRepository _projectsRepository;
  final SkillsRepository _skillsRepository;

  ResumeService({
    AboutRepository? aboutRepository,
    ContactRepository? contactRepository,
    EducationRepository? educationRepository,
    ExperienceRepository? experienceRepository,
    ProjectsRepository? projectsRepository,
    SkillsRepository? skillsRepository,
  }) : _aboutRepository =
           aboutRepository ??
           AboutRepositoryImpl(remoteDataSource: AboutRemoteDataSourceImpl()),
       _contactRepository =
           contactRepository ??
           ContactRepositoryImpl(
             remoteDataSource: ContactRemoteDataSourceImpl(),
           ),
       _educationRepository =
           educationRepository ??
           EducationRepositoryImpl(
             remoteDataSource: EducationRemoteDataSourceImpl(),
           ),
       _experienceRepository =
           experienceRepository ??
           ExperienceRepositoryImpl(
             remoteDataSource: ExperienceRemoteDataSourceImpl(),
           ),
       _projectsRepository =
           projectsRepository ??
           ProjectsRepositoryImpl(
             remoteDataSource: ProjectsRemoteDataSourceImpl(),
           ),
       _skillsRepository =
           skillsRepository ??
           SkillsRepositoryImpl(remoteDataSource: SkillsRemoteDataSourceImpl());

  /// Fetch the complete resume data from all repositories
  Future<ResumeModel> getResume() async {
    try {
      // Fetch all data in parallel for better performance
      final results = await Future.wait([
        _aboutRepository.getAbout(),
        _contactRepository.getContact(),
        _skillsRepository.getTechnicalSkills(),
        _skillsRepository.getSoftSkills(),
        _experienceRepository.getExperiences(),
        _educationRepository.getEducation(),
        _projectsRepository.getProjects(),
      ]);

      // Extract data from Either results
      final aboutResult = results[0] as Either<Failure, AboutModel>;
      final about = aboutResult.getOrElse(
        () => AboutModel(name: '', title: '', summary: ''),
      );

      final contactResult = results[1] as Either<Failure, ContactModel>;
      final contact = contactResult.getOrElse(() => ContactModel(email: ''));

      final technicalSkillsResult =
          results[2] as Either<Failure, List<SkillModel>>;
      final technicalSkills = technicalSkillsResult.getOrElse(() => []);

      final softSkillsResult = results[3] as Either<Failure, List<String>>;
      final softSkills = softSkillsResult.getOrElse(() => []);

      final experienceResult =
          results[4] as Either<Failure, List<ExperienceModel>>;
      final experience = experienceResult.getOrElse(() => []);

      final educationResult =
          results[5] as Either<Failure, List<EducationModel>>;
      final education = educationResult.getOrElse(() => []);

      final projectsResult = results[6] as Either<Failure, List<ProjectModel>>;
      final projects = projectsResult.getOrElse(() => []);

      return ResumeModel(
        about: about,
        contact: contact,
        technicalSkills: technicalSkills,
        softSkills: softSkills,
        experience: experience,
        education: education,
        projects: projects,
      );
    } catch (e) {
      // Return empty resume on error
      return ResumeModel(
        about: AboutModel(name: '', title: '', summary: ''),
        contact: ContactModel(email: ''),
        technicalSkills: [],
        softSkills: [],
        experience: [],
        education: [],
        projects: [],
      );
    }
  }

  Future<AboutModel> getAbout() async {
    final result = await _aboutRepository.getAbout();
    return result.fold(
      (l) => AboutModel(name: 'Mohamed Ibrahem', title: '', summary: ''),
      (about) => about,
    );
  }
}
