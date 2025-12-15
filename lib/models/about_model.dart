class AboutModel {
  final String name;
  final String title;
  final String summary;
  final String? profileImageUrl;
  final String? resumeUrl;

  AboutModel({
    required this.name,
    required this.title,
    required this.summary,
    this.profileImageUrl,
    this.resumeUrl,
  });

  factory AboutModel.fromJson(Map<String, dynamic> json) {
    return AboutModel(
      name: json['name'] ?? '',
      title: json['title'] ?? '',
      summary: json['summary'] ?? '',
      profileImageUrl: json['profile_image_url'],
      resumeUrl: json['resume_url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'title': title,
      'summary': summary,
      'profile_image_url': profileImageUrl,
      'resume_url': resumeUrl,
    };
  }
}
