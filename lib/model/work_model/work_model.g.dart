// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkModelImpl _$$WorkModelImplFromJson(Map<String, dynamic> json) =>
    _$WorkModelImpl(
      title: json['title'] as String,
      description: json['description'] as String,
      date: DateTime.parse(json['date'] as String),
      type: json['type'] as String,
      thumbnail: json['thumbnail'] as String?,
      link: json['link'] as String?,
    );

Map<String, dynamic> _$$WorkModelImplToJson(_$WorkModelImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'date': instance.date.toIso8601String(),
      'type': instance.type,
      'thumbnail': instance.thumbnail,
      'link': instance.link,
    };
