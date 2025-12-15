class EducationModel {
  final String degree;
  final String institution;
  final String period;
  final String? location;
  final String? description;

  EducationModel({
    required this.degree,
    required this.institution,
    required this.period,
    this.location,
    this.description,
  });

  factory EducationModel.fromJson(Map<String, dynamic> json) {
    return EducationModel(
      degree: json['degree'] ?? '',
      institution: json['institution'] ?? '',
      period: json['period'] ?? '',
      location: json['location'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'degree': degree,
      'institution': institution,
      'period': period,
      'location': location,
      'description': description,
    };
  }
}
