import 'package:portfolio/features/resume/domain/entities/resume_entity.dart';

class ResumeModel extends ResumeEntity {
  const ResumeModel({required super.url});

  factory ResumeModel.fromJson(Map<String, dynamic> json) {
    return ResumeModel(url: json['url']);
  }

  Map<String, dynamic> toJson() {
    return {
      'url': url,
    };
  }
}
