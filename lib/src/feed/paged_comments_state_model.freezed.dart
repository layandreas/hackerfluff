// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paged_comments_state_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PagedCommentsState {
  int get currentPage => throw _privateConstructorUsedError;
  List<CommentModelFlat> get stories => throw _privateConstructorUsedError;
  int get storiesPerPage => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get reachedEnd => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PagedCommentsStateCopyWith<PagedCommentsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PagedCommentsStateCopyWith<$Res> {
  factory $PagedCommentsStateCopyWith(
          PagedCommentsState value, $Res Function(PagedCommentsState) then) =
      _$PagedCommentsStateCopyWithImpl<$Res, PagedCommentsState>;
  @useResult
  $Res call(
      {int currentPage,
      List<CommentModelFlat> stories,
      int storiesPerPage,
      bool isLoading,
      bool reachedEnd});
}

/// @nodoc
class _$PagedCommentsStateCopyWithImpl<$Res, $Val extends PagedCommentsState>
    implements $PagedCommentsStateCopyWith<$Res> {
  _$PagedCommentsStateCopyWithImpl(this._value, this._then);

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
  }) {
    return _then(_value.copyWith(
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      stories: null == stories
          ? _value.stories
          : stories // ignore: cast_nullable_to_non_nullable
              as List<CommentModelFlat>,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PagedCommentsStateImplCopyWith<$Res>
    implements $PagedCommentsStateCopyWith<$Res> {
  factory _$$PagedCommentsStateImplCopyWith(_$PagedCommentsStateImpl value,
          $Res Function(_$PagedCommentsStateImpl) then) =
      __$$PagedCommentsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int currentPage,
      List<CommentModelFlat> stories,
      int storiesPerPage,
      bool isLoading,
      bool reachedEnd});
}

/// @nodoc
class __$$PagedCommentsStateImplCopyWithImpl<$Res>
    extends _$PagedCommentsStateCopyWithImpl<$Res, _$PagedCommentsStateImpl>
    implements _$$PagedCommentsStateImplCopyWith<$Res> {
  __$$PagedCommentsStateImplCopyWithImpl(_$PagedCommentsStateImpl _value,
      $Res Function(_$PagedCommentsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPage = null,
    Object? stories = null,
    Object? storiesPerPage = null,
    Object? isLoading = null,
    Object? reachedEnd = null,
  }) {
    return _then(_$PagedCommentsStateImpl(
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      stories: null == stories
          ? _value._stories
          : stories // ignore: cast_nullable_to_non_nullable
              as List<CommentModelFlat>,
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
    ));
  }
}

/// @nodoc

class _$PagedCommentsStateImpl implements _PagedCommentsState {
  const _$PagedCommentsStateImpl(
      {this.currentPage = 0,
      final List<CommentModelFlat> stories = const [],
      this.storiesPerPage = 2,
      this.isLoading = false,
      this.reachedEnd = false})
      : _stories = stories;

  @override
  @JsonKey()
  final int currentPage;
  final List<CommentModelFlat> _stories;
  @override
  @JsonKey()
  List<CommentModelFlat> get stories {
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
  String toString() {
    return 'PagedCommentsState(currentPage: $currentPage, stories: $stories, storiesPerPage: $storiesPerPage, isLoading: $isLoading, reachedEnd: $reachedEnd)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PagedCommentsStateImpl &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            const DeepCollectionEquality().equals(other._stories, _stories) &&
            (identical(other.storiesPerPage, storiesPerPage) ||
                other.storiesPerPage == storiesPerPage) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.reachedEnd, reachedEnd) ||
                other.reachedEnd == reachedEnd));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      currentPage,
      const DeepCollectionEquality().hash(_stories),
      storiesPerPage,
      isLoading,
      reachedEnd);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PagedCommentsStateImplCopyWith<_$PagedCommentsStateImpl> get copyWith =>
      __$$PagedCommentsStateImplCopyWithImpl<_$PagedCommentsStateImpl>(
          this, _$identity);
}

abstract class _PagedCommentsState implements PagedCommentsState {
  const factory _PagedCommentsState(
      {final int currentPage,
      final List<CommentModelFlat> stories,
      final int storiesPerPage,
      final bool isLoading,
      final bool reachedEnd}) = _$PagedCommentsStateImpl;

  @override
  int get currentPage;
  @override
  List<CommentModelFlat> get stories;
  @override
  int get storiesPerPage;
  @override
  bool get isLoading;
  @override
  bool get reachedEnd;
  @override
  @JsonKey(ignore: true)
  _$$PagedCommentsStateImplCopyWith<_$PagedCommentsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
