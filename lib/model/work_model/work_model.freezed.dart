// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'work_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WorkModel _$WorkModelFromJson(Map<String, dynamic> json) {
  return _WorkModel.fromJson(json);
}

/// @nodoc
mixin _$WorkModel {
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get thumbnailUrl => throw _privateConstructorUsedError;
  List<LinkModel> get links => throw _privateConstructorUsedError;
  List<String>? get idDid => throw _privateConstructorUsedError;

  /// Serializes this WorkModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WorkModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WorkModelCopyWith<WorkModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkModelCopyWith<$Res> {
  factory $WorkModelCopyWith(WorkModel value, $Res Function(WorkModel) then) =
      _$WorkModelCopyWithImpl<$Res, WorkModel>;
  @useResult
  $Res call(
      {String title,
      String description,
      DateTime date,
      String type,
      String thumbnailUrl,
      List<LinkModel> links,
      List<String>? idDid});
}

/// @nodoc
class _$WorkModelCopyWithImpl<$Res, $Val extends WorkModel>
    implements $WorkModelCopyWith<$Res> {
  _$WorkModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WorkModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? date = null,
    Object? type = null,
    Object? thumbnailUrl = null,
    Object? links = null,
    Object? idDid = freezed,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnailUrl: null == thumbnailUrl
          ? _value.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String,
      links: null == links
          ? _value.links
          : links // ignore: cast_nullable_to_non_nullable
              as List<LinkModel>,
      idDid: freezed == idDid
          ? _value.idDid
          : idDid // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WorkModelImplCopyWith<$Res>
    implements $WorkModelCopyWith<$Res> {
  factory _$$WorkModelImplCopyWith(
          _$WorkModelImpl value, $Res Function(_$WorkModelImpl) then) =
      __$$WorkModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      String description,
      DateTime date,
      String type,
      String thumbnailUrl,
      List<LinkModel> links,
      List<String>? idDid});
}

/// @nodoc
class __$$WorkModelImplCopyWithImpl<$Res>
    extends _$WorkModelCopyWithImpl<$Res, _$WorkModelImpl>
    implements _$$WorkModelImplCopyWith<$Res> {
  __$$WorkModelImplCopyWithImpl(
      _$WorkModelImpl _value, $Res Function(_$WorkModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of WorkModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? date = null,
    Object? type = null,
    Object? thumbnailUrl = null,
    Object? links = null,
    Object? idDid = freezed,
  }) {
    return _then(_$WorkModelImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnailUrl: null == thumbnailUrl
          ? _value.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String,
      links: null == links
          ? _value._links
          : links // ignore: cast_nullable_to_non_nullable
              as List<LinkModel>,
      idDid: freezed == idDid
          ? _value._idDid
          : idDid // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WorkModelImpl implements _WorkModel {
  const _$WorkModelImpl(
      {required this.title,
      required this.description,
      required this.date,
      required this.type,
      required this.thumbnailUrl,
      required final List<LinkModel> links,
      final List<String>? idDid})
      : _links = links,
        _idDid = idDid;

  factory _$WorkModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkModelImplFromJson(json);

  @override
  final String title;
  @override
  final String description;
  @override
  final DateTime date;
  @override
  final String type;
  @override
  final String thumbnailUrl;
  final List<LinkModel> _links;
  @override
  List<LinkModel> get links {
    if (_links is EqualUnmodifiableListView) return _links;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_links);
  }

  final List<String>? _idDid;
  @override
  List<String>? get idDid {
    final value = _idDid;
    if (value == null) return null;
    if (_idDid is EqualUnmodifiableListView) return _idDid;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'WorkModel(title: $title, description: $description, date: $date, type: $type, thumbnailUrl: $thumbnailUrl, links: $links, idDid: $idDid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkModelImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.thumbnailUrl, thumbnailUrl) ||
                other.thumbnailUrl == thumbnailUrl) &&
            const DeepCollectionEquality().equals(other._links, _links) &&
            const DeepCollectionEquality().equals(other._idDid, _idDid));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      title,
      description,
      date,
      type,
      thumbnailUrl,
      const DeepCollectionEquality().hash(_links),
      const DeepCollectionEquality().hash(_idDid));

  /// Create a copy of WorkModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkModelImplCopyWith<_$WorkModelImpl> get copyWith =>
      __$$WorkModelImplCopyWithImpl<_$WorkModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkModelImplToJson(
      this,
    );
  }
}

abstract class _WorkModel implements WorkModel {
  const factory _WorkModel(
      {required final String title,
      required final String description,
      required final DateTime date,
      required final String type,
      required final String thumbnailUrl,
      required final List<LinkModel> links,
      final List<String>? idDid}) = _$WorkModelImpl;

  factory _WorkModel.fromJson(Map<String, dynamic> json) =
      _$WorkModelImpl.fromJson;

  @override
  String get title;
  @override
  String get description;
  @override
  DateTime get date;
  @override
  String get type;
  @override
  String get thumbnailUrl;
  @override
  List<LinkModel> get links;
  @override
  List<String>? get idDid;

  /// Create a copy of WorkModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WorkModelImplCopyWith<_$WorkModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LinkModel _$LinkModelFromJson(Map<String, dynamic> json) {
  return _LinkModel.fromJson(json);
}

/// @nodoc
mixin _$LinkModel {
  String get link => throw _privateConstructorUsedError;
  LinkType get type => throw _privateConstructorUsedError;

  /// Serializes this LinkModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LinkModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LinkModelCopyWith<LinkModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LinkModelCopyWith<$Res> {
  factory $LinkModelCopyWith(LinkModel value, $Res Function(LinkModel) then) =
      _$LinkModelCopyWithImpl<$Res, LinkModel>;
  @useResult
  $Res call({String link, LinkType type});
}

/// @nodoc
class _$LinkModelCopyWithImpl<$Res, $Val extends LinkModel>
    implements $LinkModelCopyWith<$Res> {
  _$LinkModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LinkModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? link = null,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as LinkType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LinkModelImplCopyWith<$Res>
    implements $LinkModelCopyWith<$Res> {
  factory _$$LinkModelImplCopyWith(
          _$LinkModelImpl value, $Res Function(_$LinkModelImpl) then) =
      __$$LinkModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String link, LinkType type});
}

/// @nodoc
class __$$LinkModelImplCopyWithImpl<$Res>
    extends _$LinkModelCopyWithImpl<$Res, _$LinkModelImpl>
    implements _$$LinkModelImplCopyWith<$Res> {
  __$$LinkModelImplCopyWithImpl(
      _$LinkModelImpl _value, $Res Function(_$LinkModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of LinkModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? link = null,
    Object? type = null,
  }) {
    return _then(_$LinkModelImpl(
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as LinkType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LinkModelImpl implements _LinkModel {
  const _$LinkModelImpl({required this.link, required this.type});

  factory _$LinkModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LinkModelImplFromJson(json);

  @override
  final String link;
  @override
  final LinkType type;

  @override
  String toString() {
    return 'LinkModel(link: $link, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LinkModelImpl &&
            (identical(other.link, link) || other.link == link) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, link, type);

  /// Create a copy of LinkModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LinkModelImplCopyWith<_$LinkModelImpl> get copyWith =>
      __$$LinkModelImplCopyWithImpl<_$LinkModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LinkModelImplToJson(
      this,
    );
  }
}

abstract class _LinkModel implements LinkModel {
  const factory _LinkModel(
      {required final String link,
      required final LinkType type}) = _$LinkModelImpl;

  factory _LinkModel.fromJson(Map<String, dynamic> json) =
      _$LinkModelImpl.fromJson;

  @override
  String get link;
  @override
  LinkType get type;

  /// Create a copy of LinkModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LinkModelImplCopyWith<_$LinkModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
