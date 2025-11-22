import 'package:equatable/equatable.dart';

class ResumeEntity extends Equatable {
  final String url;

  const ResumeEntity({required this.url});

  @override
  List<Object?> get props => [url];
}
