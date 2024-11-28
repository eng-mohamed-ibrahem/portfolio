// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkModelImpl _$$WorkModelImplFromJson(Map<String, dynamic> json) =>
    _$WorkModelImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      date: DateTime.parse(json['date'] as String),
      type: json['type'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String,
      links: (json['links'] as List<dynamic>)
          .map((e) => LinkModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      idDid:
          (json['idDid'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$WorkModelImplToJson(_$WorkModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'date': instance.date.toIso8601String(),
      'type': instance.type,
      'thumbnailUrl': instance.thumbnailUrl,
      'links': instance.links,
      'idDid': instance.idDid,
    };

_$LinkModelImpl _$$LinkModelImplFromJson(Map<String, dynamic> json) =>
    _$LinkModelImpl(
      link: json['link'] as String,
      type: $enumDecode(_$LinkTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$$LinkModelImplToJson(_$LinkModelImpl instance) =>
    <String, dynamic>{
      'link': instance.link,
      'type': _$LinkTypeEnumMap[instance.type]!,
    };

const _$LinkTypeEnumMap = {
  LinkType.github: 'github',
  LinkType.youtube: 'youtube',
  LinkType.drive: 'drive',
  LinkType.apk: 'apk',
};
