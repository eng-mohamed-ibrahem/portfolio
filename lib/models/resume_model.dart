import 'package:portfolio_app/models/about_model.dart';
import 'package:portfolio_app/models/contact_model.dart';
import 'package:portfolio_app/models/education_model.dart';
import 'package:portfolio_app/models/experience_model.dart';
import 'package:portfolio_app/models/project_model.dart';
import 'package:portfolio_app/models/skill_model.dart';

// Type aliases for backward compatibility
typedef AboutData = AboutModel;
typedef ContactData = ContactModel;
typedef EducationData = EducationModel;

class ResumeModel {
  final AboutModel about;
  final ContactModel contact;
  final List<SkillModel> technicalSkills;
  final List<String> softSkills;
  final List<ExperienceModel> experience;
  final List<EducationModel> education;
  final List<ProjectModel> projects;

  ResumeModel({
    required this.about,
    required this.contact,
    required this.technicalSkills,
    required this.softSkills,
    required this.experience,
    required this.education,
    required this.projects,
  });

  factory ResumeModel.fromJson(Map<String, dynamic> json) {
    return ResumeModel(
      about: AboutModel.fromJson(json['about'] ?? {}),
      contact: ContactModel.fromJson(json['contact'] ?? {}),
      technicalSkills:
          (json['skills'] as List<dynamic>?)
              ?.map((e) => SkillModel.fromJson(e))
              .toList() ??
          [],
      softSkills:
          (json['softSkills'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
      experience:
          (json['experience'] as List<dynamic>?)
              ?.map((e) => ExperienceModel.fromJson(e))
              .toList() ??
          [],
      education:
          (json['education'] as List<dynamic>?)
              ?.map((e) => EducationModel.fromJson(e))
              .toList() ??
          [],
      projects:
          (json['projects'] as List<dynamic>?)
              ?.map((e) => ProjectModel.fromJson(e))
              .toList() ??
          [],
    );
  }
}

class SkillsData {
  final List<SkillCategory> technical;
  final List<String> softSkills;

  SkillsData({required this.technical, required this.softSkills});

  factory SkillsData.fromJson(Map<String, dynamic> json) {
    return SkillsData(
      technical:
          (json['technical'] as List<dynamic>?)
              ?.map((e) => SkillCategory.fromJson(e))
              .toList() ??
          [],
      softSkills:
          (json['softSkills'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
    );
  }
}

class SkillCategory {
  final String category;
  final List<String> skills;

  SkillCategory({required this.category, required this.skills});

  factory SkillCategory.fromJson(Map<String, dynamic> json) {
    return SkillCategory(
      category: json['category'] ?? '',
      skills:
          (json['skills'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
    );
  }
}

class ExperienceData {
  final String title;
  final String company;
  final String period;
  final String? location;
  final List<String> highlights;

  ExperienceData({
    required this.title,
    required this.company,
    required this.period,
    this.location,
    required this.highlights,
  });

  factory ExperienceData.fromJson(Map<String, dynamic> json) {
    return ExperienceData(
      title: json['title'] ?? '',
      company: json['company'] ?? '',
      period: json['period'] ?? '',
      location: json['location'],
      highlights:
          (json['highlights'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
    );
  }
}

class ProjectData {
  final String name;
  final String description;
  final List<String> technologies;
  final String? imageUrl;
  final String? liveUrl;
  final String? githubUrl;

  ProjectData({
    required this.name,
    required this.description,
    required this.technologies,
    this.imageUrl,
    this.liveUrl,
    this.githubUrl,
  });

  factory ProjectData.fromJson(Map<String, dynamic> json) {
    return ProjectData(
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      technologies:
          (json['technologies'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
      imageUrl: json['imageUrl'],
      liveUrl: json['liveUrl'],
      githubUrl: json['githubUrl'],
    );
  }
}
