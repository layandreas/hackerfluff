// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comment_status_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CommentStatusModel _$CommentStatusModelFromJson(Map<String, dynamic> json) {
  return _CommentStatusModel.fromJson(json);
}

/// @nodoc
mixin _$CommentStatusModel {
  int get id => throw _privateConstructorUsedError;
  int get commentWasSeen => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommentStatusModelCopyWith<CommentStatusModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentStatusModelCopyWith<$Res> {
  factory $CommentStatusModelCopyWith(
          CommentStatusModel value, $Res Function(CommentStatusModel) then) =
      _$CommentStatusModelCopyWithImpl<$Res, CommentStatusModel>;
  @useResult
  $Res call({int id, int commentWasSeen});
}

/// @nodoc
class _$CommentStatusModelCopyWithImpl<$Res, $Val extends CommentStatusModel>
    implements $CommentStatusModelCopyWith<$Res> {
  _$CommentStatusModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? commentWasSeen = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      commentWasSeen: null == commentWasSeen
          ? _value.commentWasSeen
          : commentWasSeen // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CommentStatusModelImplCopyWith<$Res>
    implements $CommentStatusModelCopyWith<$Res> {
  factory _$$CommentStatusModelImplCopyWith(_$CommentStatusModelImpl value,
          $Res Function(_$CommentStatusModelImpl) then) =
      __$$CommentStatusModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, int commentWasSeen});
}

/// @nodoc
class __$$CommentStatusModelImplCopyWithImpl<$Res>
    extends _$CommentStatusModelCopyWithImpl<$Res, _$CommentStatusModelImpl>
    implements _$$CommentStatusModelImplCopyWith<$Res> {
  __$$CommentStatusModelImplCopyWithImpl(_$CommentStatusModelImpl _value,
      $Res Function(_$CommentStatusModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? commentWasSeen = null,
  }) {
    return _then(_$CommentStatusModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      commentWasSeen: null == commentWasSeen
          ? _value.commentWasSeen
          : commentWasSeen // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CommentStatusModelImpl implements _CommentStatusModel {
  const _$CommentStatusModelImpl(
      {required this.id, required this.commentWasSeen});

  factory _$CommentStatusModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommentStatusModelImplFromJson(json);

  @override
  final int id;
  @override
  final int commentWasSeen;

  @override
  String toString() {
    return 'CommentStatusModel(id: $id, commentWasSeen: $commentWasSeen)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommentStatusModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.commentWasSeen, commentWasSeen) ||
                other.commentWasSeen == commentWasSeen));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, commentWasSeen);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CommentStatusModelImplCopyWith<_$CommentStatusModelImpl> get copyWith =>
      __$$CommentStatusModelImplCopyWithImpl<_$CommentStatusModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommentStatusModelImplToJson(
      this,
    );
  }
}

abstract class _CommentStatusModel implements CommentStatusModel {
  const factory _CommentStatusModel(
      {required final int id,
      required final int commentWasSeen}) = _$CommentStatusModelImpl;

  factory _CommentStatusModel.fromJson(Map<String, dynamic> json) =
      _$CommentStatusModelImpl.fromJson;

  @override
  int get id;
  @override
  int get commentWasSeen;
  @override
  @JsonKey(ignore: true)
  _$$CommentStatusModelImplCopyWith<_$CommentStatusModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
