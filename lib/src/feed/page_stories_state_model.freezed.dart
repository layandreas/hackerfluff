// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'page_stories_state_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PagedStoriesState _$PagedStoriesStateFromJson(Map<String, dynamic> json) {
  return _PagedStoriesState.fromJson(json);
}

/// @nodoc
mixin _$PagedStoriesState {
  int get currentPage => throw _privateConstructorUsedError;
  List<Story> get stories => throw _privateConstructorUsedError;
  int get storiesPerPage => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get reachedEnd => throw _privateConstructorUsedError;
  int get nErrors => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PagedStoriesStateCopyWith<PagedStoriesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PagedStoriesStateCopyWith<$Res> {
  factory $PagedStoriesStateCopyWith(
          PagedStoriesState value, $Res Function(PagedStoriesState) then) =
      _$PagedStoriesStateCopyWithImpl<$Res, PagedStoriesState>;
  @useResult
  $Res call(
      {int currentPage,
      List<Story> stories,
      int storiesPerPage,
      bool isLoading,
      bool reachedEnd,
      int nErrors});
}

/// @nodoc
class _$PagedStoriesStateCopyWithImpl<$Res, $Val extends PagedStoriesState>
    implements $PagedStoriesStateCopyWith<$Res> {
  _$PagedStoriesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPage = null,
    Object? stories = null,
    Object? storiesPerPage = null,
    Object? isLoading = null,
    Object? reachedEnd = null,
    Object? nErrors = null,
  }) {
    return _then(_value.copyWith(
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      stories: null == stories
          ? _value.stories
          : stories // ignore: cast_nullable_to_non_nullable
              as List<Story>,
      storiesPerPage: null == storiesPerPage
          ? _value.storiesPerPage
          : storiesPerPage // ignore: cast_nullable_to_non_nullable
              as int,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      reachedEnd: null == reachedEnd
          ? _value.reachedEnd
          : reachedEnd // ignore: cast_nullable_to_non_nullable
              as bool,
      nErrors: null == nErrors
          ? _value.nErrors
          : nErrors // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PagedStoriesStateImplCopyWith<$Res>
    implements $PagedStoriesStateCopyWith<$Res> {
  factory _$$PagedStoriesStateImplCopyWith(_$PagedStoriesStateImpl value,
          $Res Function(_$PagedStoriesStateImpl) then) =
      __$$PagedStoriesStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int currentPage,
      List<Story> stories,
      int storiesPerPage,
      bool isLoading,
      bool reachedEnd,
      int nErrors});
}

/// @nodoc
class __$$PagedStoriesStateImplCopyWithImpl<$Res>
    extends _$PagedStoriesStateCopyWithImpl<$Res, _$PagedStoriesStateImpl>
    implements _$$PagedStoriesStateImplCopyWith<$Res> {
  __$$PagedStoriesStateImplCopyWithImpl(_$PagedStoriesStateImpl _value,
      $Res Function(_$PagedStoriesStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPage = null,
    Object? stories = null,
    Object? storiesPerPage = null,
    Object? isLoading = null,
    Object? reachedEnd = null,
    Object? nErrors = null,
  }) {
    return _then(_$PagedStoriesStateImpl(
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      stories: null == stories
          ? _value._stories
          : stories // ignore: cast_nullable_to_non_nullable
              as List<Story>,
      storiesPerPage: null == storiesPerPage
          ? _value.storiesPerPage
          : storiesPerPage // ignore: cast_nullable_to_non_nullable
              as int,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      reachedEnd: null == reachedEnd
          ? _value.reachedEnd
          : reachedEnd // ignore: cast_nullable_to_non_nullable
              as bool,
      nErrors: null == nErrors
          ? _value.nErrors
          : nErrors // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PagedStoriesStateImpl implements _PagedStoriesState {
  const _$PagedStoriesStateImpl(
      {this.currentPage = 0,
      final List<Story> stories = const [],
      this.storiesPerPage = 2,
      this.isLoading = false,
      this.reachedEnd = false,
      this.nErrors = 0})
      : _stories = stories;

  factory _$PagedStoriesStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$PagedStoriesStateImplFromJson(json);

  @override
  @JsonKey()
  final int currentPage;
  final List<Story> _stories;
  @override
  @JsonKey()
  List<Story> get stories {
    if (_stories is EqualUnmodifiableListView) return _stories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_stories);
  }

  @override
  @JsonKey()
  final int storiesPerPage;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool reachedEnd;
  @override
  @JsonKey()
  final int nErrors;

  @override
  String toString() {
    return 'PagedStoriesState(currentPage: $currentPage, stories: $stories, storiesPerPage: $storiesPerPage, isLoading: $isLoading, reachedEnd: $reachedEnd, nErrors: $nErrors)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PagedStoriesStateImpl &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            const DeepCollectionEquality().equals(other._stories, _stories) &&
            (identical(other.storiesPerPage, storiesPerPage) ||
                other.storiesPerPage == storiesPerPage) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.reachedEnd, reachedEnd) ||
                other.reachedEnd == reachedEnd) &&
            (identical(other.nErrors, nErrors) || other.nErrors == nErrors));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      currentPage,
      const DeepCollectionEquality().hash(_stories),
      storiesPerPage,
      isLoading,
      reachedEnd,
      nErrors);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PagedStoriesStateImplCopyWith<_$PagedStoriesStateImpl> get copyWith =>
      __$$PagedStoriesStateImplCopyWithImpl<_$PagedStoriesStateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PagedStoriesStateImplToJson(
      this,
    );
  }
}

abstract class _PagedStoriesState implements PagedStoriesState {
  const factory _PagedStoriesState(
      {final int currentPage,
      final List<Story> stories,
      final int storiesPerPage,
      final bool isLoading,
      final bool reachedEnd,
      final int nErrors}) = _$PagedStoriesStateImpl;

  factory _PagedStoriesState.fromJson(Map<String, dynamic> json) =
      _$PagedStoriesStateImpl.fromJson;

  @override
  int get currentPage;
  @override
  List<Story> get stories;
  @override
  int get storiesPerPage;
  @override
  bool get isLoading;
  @override
  bool get reachedEnd;
  @override
  int get nErrors;
  @override
  @JsonKey(ignore: true)
  _$$PagedStoriesStateImplCopyWith<_$PagedStoriesStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
