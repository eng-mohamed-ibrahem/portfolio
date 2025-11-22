import 'package:equatable/equatable.dart';

class HomeEntity extends Equatable {
  final String name;
  final String title;
  final String summary;

  const HomeEntity({
    required this.name,
    required this.title,
    required this.summary,
  });

  @override
  List<Object?> get props => [name, title, summary];
}
