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
  String? get thumbnail => throw _privateConstructorUsedError;
  String? get link => throw _privateConstructorUsedError;

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
      String? thumbnail,
      String? link});
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
    Object? thumbnail = freezed,
    Object? link = freezed,
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
      thumbnail: freezed == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
      link: freezed == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String?,
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
      String? thumbnail,
      String? link});
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
    Object? thumbnail = freezed,
    Object? link = freezed,
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
      thumbnail: freezed == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
      link: freezed == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String?,
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
      this.thumbnail,
      this.link});

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
  final String? thumbnail;
  @override
  final String? link;

  @override
  String toString() {
    return 'WorkModel(title: $title, description: $description, date: $date, type: $type, thumbnail: $thumbnail, link: $link)';
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
            (identical(other.thumbnail, thumbnail) ||
                other.thumbnail == thumbnail) &&
            (identical(other.link, link) || other.link == link));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, title, description, date, type, thumbnail, link);

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
      final String? thumbnail,
      final String? link}) = _$WorkModelImpl;

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
  String? get thumbnail;
  @override
  String? get link;

  /// Create a copy of WorkModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WorkModelImplCopyWith<_$WorkModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
