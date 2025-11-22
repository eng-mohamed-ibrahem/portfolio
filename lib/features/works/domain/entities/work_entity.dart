import 'package:equatable/equatable.dart';

class WorkEntity extends Equatable {
  final String title;
  final String company;
  final String duration;
  final String description;

  const WorkEntity({
    required this.title,
    required this.company,
    required this.duration,
    required this.description,
  });

  @override
  List<Object?> get props => [title, company, duration, description];
}
