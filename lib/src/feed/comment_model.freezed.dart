// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comment_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Comment _$CommentFromJson(Map<String, dynamic> json) {
  return _Comment.fromJson(json);
}

/// @nodoc
mixin _$Comment {
  int get id => throw _privateConstructorUsedError;
  String? get text => throw _privateConstructorUsedError;
  List<int>? get kids => throw _privateConstructorUsedError;
  String? get by => throw _privateConstructorUsedError;
  int? get time => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommentCopyWith<Comment> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentCopyWith<$Res> {
  factory $CommentCopyWith(Comment value, $Res Function(Comment) then) =
      _$CommentCopyWithImpl<$Res, Comment>;
  @useResult
  $Res call({int id, String? text, List<int>? kids, String? by, int? time});
}

/// @nodoc
class _$CommentCopyWithImpl<$Res, $Val extends Comment>
    implements $CommentCopyWith<$Res> {
  _$CommentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? text = freezed,
    Object? kids = freezed,
    Object? by = freezed,
    Object? time = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      kids: freezed == kids
          ? _value.kids
          : kids // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      by: freezed == by
          ? _value.by
          : by // ignore: cast_nullable_to_non_nullable
              as String?,
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CommentImplCopyWith<$Res> implements $CommentCopyWith<$Res> {
  factory _$$CommentImplCopyWith(
          _$CommentImpl value, $Res Function(_$CommentImpl) then) =
      __$$CommentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String? text, List<int>? kids, String? by, int? time});
}

/// @nodoc
class __$$CommentImplCopyWithImpl<$Res>
    extends _$CommentCopyWithImpl<$Res, _$CommentImpl>
    implements _$$CommentImplCopyWith<$Res> {
  __$$CommentImplCopyWithImpl(
      _$CommentImpl _value, $Res Function(_$CommentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? text = freezed,
    Object? kids = freezed,
    Object? by = freezed,
    Object? time = freezed,
  }) {
    return _then(_$CommentImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      kids: freezed == kids
          ? _value._kids
          : kids // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      by: freezed == by
          ? _value.by
          : by // ignore: cast_nullable_to_non_nullable
              as String?,
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CommentImpl implements _Comment {
  const _$CommentImpl(
      {required this.id,
      required this.text,
      final List<int>? kids,
      required this.by,
      required this.time})
      : _kids = kids;

  factory _$CommentImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommentImplFromJson(json);

  @override
  final int id;
  @override
  final String? text;
  final List<int>? _kids;
  @override
  List<int>? get kids {
    final value = _kids;
    if (value == null) return null;
    if (_kids is EqualUnmodifiableListView) return _kids;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? by;
  @override
  final int? time;

  @override
  String toString() {
    return 'Comment(id: $id, text: $text, kids: $kids, by: $by, time: $time)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.text, text) || other.text == text) &&
            const DeepCollectionEquality().equals(other._kids, _kids) &&
            (identical(other.by, by) || other.by == by) &&
            (identical(other.time, time) || other.time == time));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, text,
      const DeepCollectionEquality().hash(_kids), by, time);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CommentImplCopyWith<_$CommentImpl> get copyWith =>
      __$$CommentImplCopyWithImpl<_$CommentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommentImplToJson(
      this,
    );
  }
}

abstract class _Comment implements Comment {
  const factory _Comment(
      {required final int id,
      required final String? text,
      final List<int>? kids,
      required final String? by,
      required final int? time}) = _$CommentImpl;

  factory _Comment.fromJson(Map<String, dynamic> json) = _$CommentImpl.fromJson;

  @override
  int get id;
  @override
  String? get text;
  @override
  List<int>? get kids;
  @override
  String? get by;
  @override
  int? get time;
  @override
  @JsonKey(ignore: true)
  _$$CommentImplCopyWith<_$CommentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CommentModel _$CommentModelFromJson(Map<String, dynamic> json) {
  return _CommentModel.fromJson(json);
}

/// @nodoc
mixin _$CommentModel {
  int get id => throw _privateConstructorUsedError;
  String? get text => throw _privateConstructorUsedError;
  List<CommentModel>? get children => throw _privateConstructorUsedError;
  String? get by => throw _privateConstructorUsedError;
  int? get time => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommentModelCopyWith<CommentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentModelCopyWith<$Res> {
  factory $CommentModelCopyWith(
          CommentModel value, $Res Function(CommentModel) then) =
      _$CommentModelCopyWithImpl<$Res, CommentModel>;
  @useResult
  $Res call(
      {int id,
      String? text,
      List<CommentModel>? children,
      String? by,
      int? time});
}

/// @nodoc
class _$CommentModelCopyWithImpl<$Res, $Val extends CommentModel>
    implements $CommentModelCopyWith<$Res> {
  _$CommentModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? text = freezed,
    Object? children = freezed,
    Object? by = freezed,
    Object? time = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      children: freezed == children
          ? _value.children
          : children // ignore: cast_nullable_to_non_nullable
              as List<CommentModel>?,
      by: freezed == by
          ? _value.by
          : by // ignore: cast_nullable_to_non_nullable
              as String?,
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CommentModelImplCopyWith<$Res>
    implements $CommentModelCopyWith<$Res> {
  factory _$$CommentModelImplCopyWith(
          _$CommentModelImpl value, $Res Function(_$CommentModelImpl) then) =
      __$$CommentModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String? text,
      List<CommentModel>? children,
      String? by,
      int? time});
}

/// @nodoc
class __$$CommentModelImplCopyWithImpl<$Res>
    extends _$CommentModelCopyWithImpl<$Res, _$CommentModelImpl>
    implements _$$CommentModelImplCopyWith<$Res> {
  __$$CommentModelImplCopyWithImpl(
      _$CommentModelImpl _value, $Res Function(_$CommentModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? text = freezed,
    Object? children = freezed,
    Object? by = freezed,
    Object? time = freezed,
  }) {
    return _then(_$CommentModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      children: freezed == children
          ? _value._children
          : children // ignore: cast_nullable_to_non_nullable
              as List<CommentModel>?,
      by: freezed == by
          ? _value.by
          : by // ignore: cast_nullable_to_non_nullable
              as String?,
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CommentModelImpl implements _CommentModel {
  const _$CommentModelImpl(
      {required this.id,
      this.text,
      final List<CommentModel>? children,
      required this.by,
      required this.time})
      : _children = children;

  factory _$CommentModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommentModelImplFromJson(json);

  @override
  final int id;
  @override
  final String? text;
  final List<CommentModel>? _children;
  @override
  List<CommentModel>? get children {
    final value = _children;
    if (value == null) return null;
    if (_children is EqualUnmodifiableListView) return _children;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? by;
  @override
  final int? time;

  @override
  String toString() {
    return 'CommentModel(id: $id, text: $text, children: $children, by: $by, time: $time)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommentModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.text, text) || other.text == text) &&
            const DeepCollectionEquality().equals(other._children, _children) &&
            (identical(other.by, by) || other.by == by) &&
            (identical(other.time, time) || other.time == time));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, text,
      const DeepCollectionEquality().hash(_children), by, time);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CommentModelImplCopyWith<_$CommentModelImpl> get copyWith =>
      __$$CommentModelImplCopyWithImpl<_$CommentModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommentModelImplToJson(
      this,
    );
  }
}

abstract class _CommentModel implements CommentModel {
  const factory _CommentModel(
      {required final int id,
      final String? text,
      final List<CommentModel>? children,
      required final String? by,
      required final int? time}) = _$CommentModelImpl;

  factory _CommentModel.fromJson(Map<String, dynamic> json) =
      _$CommentModelImpl.fromJson;

  @override
  int get id;
  @override
  String? get text;
  @override
  List<CommentModel>? get children;
  @override
  String? get by;
  @override
  int? get time;
  @override
  @JsonKey(ignore: true)
  _$$CommentModelImplCopyWith<_$CommentModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CommentModelFlat _$CommentModelFlatFromJson(Map<String, dynamic> json) {
  return _CommentModelFlat.fromJson(json);
}

/// @nodoc
mixin _$CommentModelFlat {
  int get id => throw _privateConstructorUsedError;
  String? get text => throw _privateConstructorUsedError;
  int? get parentId => throw _privateConstructorUsedError;
  int? get nParents => throw _privateConstructorUsedError;
  int? get nChildren => throw _privateConstructorUsedError;
  List<int>? get children => throw _privateConstructorUsedError;
  String? get by => throw _privateConstructorUsedError;
  int? get time => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommentModelFlatCopyWith<CommentModelFlat> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentModelFlatCopyWith<$Res> {
  factory $CommentModelFlatCopyWith(
          CommentModelFlat value, $Res Function(CommentModelFlat) then) =
      _$CommentModelFlatCopyWithImpl<$Res, CommentModelFlat>;
  @useResult
  $Res call(
      {int id,
      String? text,
      int? parentId,
      int? nParents,
      int? nChildren,
      List<int>? children,
      String? by,
      int? time});
}

/// @nodoc
class _$CommentModelFlatCopyWithImpl<$Res, $Val extends CommentModelFlat>
    implements $CommentModelFlatCopyWith<$Res> {
  _$CommentModelFlatCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? text = freezed,
    Object? parentId = freezed,
    Object? nParents = freezed,
    Object? nChildren = freezed,
    Object? children = freezed,
    Object? by = freezed,
    Object? time = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      parentId: freezed == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as int?,
      nParents: freezed == nParents
          ? _value.nParents
          : nParents // ignore: cast_nullable_to_non_nullable
              as int?,
      nChildren: freezed == nChildren
          ? _value.nChildren
          : nChildren // ignore: cast_nullable_to_non_nullable
              as int?,
      children: freezed == children
          ? _value.children
          : children // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      by: freezed == by
          ? _value.by
          : by // ignore: cast_nullable_to_non_nullable
              as String?,
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CommentModelFlatImplCopyWith<$Res>
    implements $CommentModelFlatCopyWith<$Res> {
  factory _$$CommentModelFlatImplCopyWith(_$CommentModelFlatImpl value,
          $Res Function(_$CommentModelFlatImpl) then) =
      __$$CommentModelFlatImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String? text,
      int? parentId,
      int? nParents,
      int? nChildren,
      List<int>? children,
      String? by,
      int? time});
}

/// @nodoc
class __$$CommentModelFlatImplCopyWithImpl<$Res>
    extends _$CommentModelFlatCopyWithImpl<$Res, _$CommentModelFlatImpl>
    implements _$$CommentModelFlatImplCopyWith<$Res> {
  __$$CommentModelFlatImplCopyWithImpl(_$CommentModelFlatImpl _value,
      $Res Function(_$CommentModelFlatImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? text = freezed,
    Object? parentId = freezed,
    Object? nParents = freezed,
    Object? nChildren = freezed,
    Object? children = freezed,
    Object? by = freezed,
    Object? time = freezed,
  }) {
    return _then(_$CommentModelFlatImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      parentId: freezed == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as int?,
      nParents: freezed == nParents
          ? _value.nParents
          : nParents // ignore: cast_nullable_to_non_nullable
              as int?,
      nChildren: freezed == nChildren
          ? _value.nChildren
          : nChildren // ignore: cast_nullable_to_non_nullable
              as int?,
      children: freezed == children
          ? _value._children
          : children // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      by: freezed == by
          ? _value.by
          : by // ignore: cast_nullable_to_non_nullable
              as String?,
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CommentModelFlatImpl implements _CommentModelFlat {
  const _$CommentModelFlatImpl(
      {required this.id,
      this.text,
      this.parentId,
      this.nParents,
      this.nChildren,
      final List<int>? children,
      required this.by,
      required this.time})
      : _children = children;

  factory _$CommentModelFlatImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommentModelFlatImplFromJson(json);

  @override
  final int id;
  @override
  final String? text;
  @override
  final int? parentId;
  @override
  final int? nParents;
  @override
  final int? nChildren;
  final List<int>? _children;
  @override
  List<int>? get children {
    final value = _children;
    if (value == null) return null;
    if (_children is EqualUnmodifiableListView) return _children;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? by;
  @override
  final int? time;

  @override
  String toString() {
    return 'CommentModelFlat(id: $id, text: $text, parentId: $parentId, nParents: $nParents, nChildren: $nChildren, children: $children, by: $by, time: $time)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommentModelFlatImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.parentId, parentId) ||
                other.parentId == parentId) &&
            (identical(other.nParents, nParents) ||
                other.nParents == nParents) &&
            (identical(other.nChildren, nChildren) ||
                other.nChildren == nChildren) &&
            const DeepCollectionEquality().equals(other._children, _children) &&
            (identical(other.by, by) || other.by == by) &&
            (identical(other.time, time) || other.time == time));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, text, parentId, nParents,
      nChildren, const DeepCollectionEquality().hash(_children), by, time);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CommentModelFlatImplCopyWith<_$CommentModelFlatImpl> get copyWith =>
      __$$CommentModelFlatImplCopyWithImpl<_$CommentModelFlatImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommentModelFlatImplToJson(
      this,
    );
  }
}

abstract class _CommentModelFlat implements CommentModelFlat {
  const factory _CommentModelFlat(
      {required final int id,
      final String? text,
      final int? parentId,
      final int? nParents,
      final int? nChildren,
      final List<int>? children,
      required final String? by,
      required final int? time}) = _$CommentModelFlatImpl;

  factory _CommentModelFlat.fromJson(Map<String, dynamic> json) =
      _$CommentModelFlatImpl.fromJson;

  @override
  int get id;
  @override
  String? get text;
  @override
  int? get parentId;
  @override
  int? get nParents;
  @override
  int? get nChildren;
  @override
  List<int>? get children;
  @override
  String? get by;
  @override
  int? get time;
  @override
  @JsonKey(ignore: true)
  _$$CommentModelFlatImplCopyWith<_$CommentModelFlatImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
