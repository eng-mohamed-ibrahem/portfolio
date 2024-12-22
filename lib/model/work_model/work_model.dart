import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'work_model.freezed.dart';
part 'work_model.g.dart';

@freezed
class WorkModel with _$WorkModel {
  const factory WorkModel({
    required String id,
    required String title,
    required String description,
    required DateTime date,
    required String type,
    required String thumbnailUrl,
    required List<LinkModel> links,
    List<String>? idDid,
  }) = _WorkModel;

  factory WorkModel.fromJson(Map<String, dynamic> json) =>
      _$WorkModelFromJson(json);
}

enum LinkType {
  github(
    Icon(
      FontAwesomeIcons.github,
      color: Colors.black,
    ),
  ),
  youtube(
    Icon(
      FontAwesomeIcons.youtube,
      color: Colors.red,
    ),
  ),
  drive(
    Icon(
      FontAwesomeIcons.googleDrive,
      color: Colors.blue,
    ),
  ),
  apk(
    Icon(
      FontAwesomeIcons.android,
      color: Colors.green,
    ),
  ),
  amazon(
    Icon(
      FontAwesomeIcons.amazon,
      color: Colors.orange,
    ),
  );

  final Widget icon;
  const LinkType(this.icon);
}

@freezed
class LinkModel with _$LinkModel {
  const factory LinkModel({
    required String link,
    required LinkType type,
  }) = _LinkModel;

  factory LinkModel.fromJson(Map<String, dynamic> json) =>
      _$LinkModelFromJson(json);
}
