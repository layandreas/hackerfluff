// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'top_stories_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TopStories _$TopStoriesFromJson(Map<String, dynamic> json) {
  return _TopStories.fromJson(json);
}

/// @nodoc
mixin _$TopStories {
  List<int> get storyIds => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TopStoriesCopyWith<TopStories> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TopStoriesCopyWith<$Res> {
  factory $TopStoriesCopyWith(
          TopStories value, $Res Function(TopStories) then) =
      _$TopStoriesCopyWithImpl<$Res, TopStories>;
  @useResult
  $Res call({List<int> storyIds});
}

/// @nodoc
class _$TopStoriesCopyWithImpl<$Res, $Val extends TopStories>
    implements $TopStoriesCopyWith<$Res> {
  _$TopStoriesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? storyIds = null,
  }) {
    return _then(_value.copyWith(
      storyIds: null == storyIds
          ? _value.storyIds
          : storyIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TopStoriesImplCopyWith<$Res>
    implements $TopStoriesCopyWith<$Res> {
  factory _$$TopStoriesImplCopyWith(
          _$TopStoriesImpl value, $Res Function(_$TopStoriesImpl) then) =
      __$$TopStoriesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<int> storyIds});
}

/// @nodoc
class __$$TopStoriesImplCopyWithImpl<$Res>
    extends _$TopStoriesCopyWithImpl<$Res, _$TopStoriesImpl>
    implements _$$TopStoriesImplCopyWith<$Res> {
  __$$TopStoriesImplCopyWithImpl(
      _$TopStoriesImpl _value, $Res Function(_$TopStoriesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? storyIds = null,
  }) {
    return _then(_$TopStoriesImpl(
      storyIds: null == storyIds
          ? _value._storyIds
          : storyIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TopStoriesImpl implements _TopStories {
  _$TopStoriesImpl({required final List<int> storyIds}) : _storyIds = storyIds;

  factory _$TopStoriesImpl.fromJson(Map<String, dynamic> json) =>
      _$$TopStoriesImplFromJson(json);

  final List<int> _storyIds;
  @override
  List<int> get storyIds {
    if (_storyIds is EqualUnmodifiableListView) return _storyIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_storyIds);
  }

  @override
  String toString() {
    return 'TopStories(storyIds: $storyIds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TopStoriesImpl &&
            const DeepCollectionEquality().equals(other._storyIds, _storyIds));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_storyIds));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TopStoriesImplCopyWith<_$TopStoriesImpl> get copyWith =>
      __$$TopStoriesImplCopyWithImpl<_$TopStoriesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TopStoriesImplToJson(
      this,
    );
  }
}

abstract class _TopStories implements TopStories {
  factory _TopStories({required final List<int> storyIds}) = _$TopStoriesImpl;

  factory _TopStories.fromJson(Map<String, dynamic> json) =
      _$TopStoriesImpl.fromJson;

  @override
  List<int> get storyIds;
  @override
  @JsonKey(ignore: true)
  _$$TopStoriesImplCopyWith<_$TopStoriesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
