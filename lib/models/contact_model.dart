class ContactModel {
  final String email;
  final String? phone;
  final String? github;
  final String? linkedin;
  final String? website;
  final String? location;

  ContactModel({
    required this.email,
    this.phone,
    this.github,
    this.linkedin,
    this.website,
    this.location,
  });

  factory ContactModel.fromJson(Map<String, dynamic> json) {
    return ContactModel(
      email: json['email'] ?? '',
      phone: json['phone'],
      github: json['github'],
      linkedin: json['linkedin'],
      website: json['website'],
      location: json['location'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'phone': phone,
      'github': github,
      'linkedin': linkedin,
      'website': website,
      'location': location,
    };
  }
}
