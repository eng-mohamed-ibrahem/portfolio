import 'package:portfolio/features/home/domain/entities/home_entity.dart';

class HomeModel extends HomeEntity {
  const HomeModel({
    required super.name,
    required super.title,
    required super.summary,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
      name: json['name'],
      title: json['title'],
      summary: json['summary'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'title': title,
      'summary': summary,
    };
  }
}
