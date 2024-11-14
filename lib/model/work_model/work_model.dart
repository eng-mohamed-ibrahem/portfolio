import 'package:freezed_annotation/freezed_annotation.dart';

part 'work_model.freezed.dart';
part 'work_model.g.dart';

@freezed
class WorkModel with _$WorkModel {
  const factory WorkModel({
    required String title,
    required String description,
    required DateTime date,
    required String type,
    String? thumbnail,
    String? link,
  }) = _WorkModel;

  factory WorkModel.fromJson(Map<String, dynamic> json) =>
      _$WorkModelFromJson(json);
}
