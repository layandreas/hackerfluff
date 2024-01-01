// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app.dart';

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

Story _$StoryFromJson(Map<String, dynamic> json) {
  return _Story.fromJson(json);
}

/// @nodoc
mixin _$Story {
  String get title => throw _privateConstructorUsedError;
  List<int>? get kids => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StoryCopyWith<Story> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoryCopyWith<$Res> {
  factory $StoryCopyWith(Story value, $Res Function(Story) then) =
      _$StoryCopyWithImpl<$Res, Story>;
  @useResult
  $Res call({String title, List<int>? kids});
}

/// @nodoc
class _$StoryCopyWithImpl<$Res, $Val extends Story>
    implements $StoryCopyWith<$Res> {
  _$StoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? kids = freezed,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      kids: freezed == kids
          ? _value.kids
          : kids // ignore: cast_nullable_to_non_nullable
              as List<int>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StoryImplCopyWith<$Res> implements $StoryCopyWith<$Res> {
  factory _$$StoryImplCopyWith(
          _$StoryImpl value, $Res Function(_$StoryImpl) then) =
      __$$StoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, List<int>? kids});
}

/// @nodoc
class __$$StoryImplCopyWithImpl<$Res>
    extends _$StoryCopyWithImpl<$Res, _$StoryImpl>
    implements _$$StoryImplCopyWith<$Res> {
  __$$StoryImplCopyWithImpl(
      _$StoryImpl _value, $Res Function(_$StoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? kids = freezed,
  }) {
    return _then(_$StoryImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      kids: freezed == kids
          ? _value._kids
          : kids // ignore: cast_nullable_to_non_nullable
              as List<int>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StoryImpl implements _Story {
  const _$StoryImpl({required this.title, final List<int>? kids})
      : _kids = kids;

  factory _$StoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$StoryImplFromJson(json);

  @override
  final String title;
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
  String toString() {
    return 'Story(title: $title, kids: $kids)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoryImpl &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other._kids, _kids));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, title, const DeepCollectionEquality().hash(_kids));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StoryImplCopyWith<_$StoryImpl> get copyWith =>
      __$$StoryImplCopyWithImpl<_$StoryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StoryImplToJson(
      this,
    );
  }
}

abstract class _Story implements Story {
  const factory _Story({required final String title, final List<int>? kids}) =
      _$StoryImpl;

  factory _Story.fromJson(Map<String, dynamic> json) = _$StoryImpl.fromJson;

  @override
  String get title;
  @override
  List<int>? get kids;
  @override
  @JsonKey(ignore: true)
  _$$StoryImplCopyWith<_$StoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PagedStoriesState {
  int get currentPage => throw _privateConstructorUsedError;
  List<Story> get stories => throw _privateConstructorUsedError;
  int get storiesPerPage => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get reachedEnd => throw _privateConstructorUsedError;

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
      bool reachedEnd});
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
      bool reachedEnd});
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
    ));
  }
}

/// @nodoc

class _$PagedStoriesStateImpl implements _PagedStoriesState {
  const _$PagedStoriesStateImpl(
      {this.currentPage = 0,
      final List<Story> stories = const [],
      this.storiesPerPage = 2,
      this.isLoading = false,
      this.reachedEnd = false})
      : _stories = stories;

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
  String toString() {
    return 'PagedStoriesState(currentPage: $currentPage, stories: $stories, storiesPerPage: $storiesPerPage, isLoading: $isLoading, reachedEnd: $reachedEnd)';
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
  _$$PagedStoriesStateImplCopyWith<_$PagedStoriesStateImpl> get copyWith =>
      __$$PagedStoriesStateImplCopyWithImpl<_$PagedStoriesStateImpl>(
          this, _$identity);
}

abstract class _PagedStoriesState implements PagedStoriesState {
  const factory _PagedStoriesState(
      {final int currentPage,
      final List<Story> stories,
      final int storiesPerPage,
      final bool isLoading,
      final bool reachedEnd}) = _$PagedStoriesStateImpl;

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
  @JsonKey(ignore: true)
  _$$PagedStoriesStateImplCopyWith<_$PagedStoriesStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Comment _$CommentFromJson(Map<String, dynamic> json) {
  return _Comment.fromJson(json);
}

/// @nodoc
mixin _$Comment {
  int get id => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  List<int>? get kids => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommentCopyWith<Comment> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentCopyWith<$Res> {
  factory $CommentCopyWith(Comment value, $Res Function(Comment) then) =
      _$CommentCopyWithImpl<$Res, Comment>;
  @useResult
  $Res call({int id, String text, List<int>? kids});
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
    Object? text = null,
    Object? kids = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      kids: freezed == kids
          ? _value.kids
          : kids // ignore: cast_nullable_to_non_nullable
              as List<int>?,
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
  $Res call({int id, String text, List<int>? kids});
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
    Object? text = null,
    Object? kids = freezed,
  }) {
    return _then(_$CommentImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      kids: freezed == kids
          ? _value._kids
          : kids // ignore: cast_nullable_to_non_nullable
              as List<int>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CommentImpl implements _Comment {
  const _$CommentImpl(
      {required this.id, required this.text, final List<int>? kids})
      : _kids = kids;

  factory _$CommentImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommentImplFromJson(json);

  @override
  final int id;
  @override
  final String text;
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
  String toString() {
    return 'Comment(id: $id, text: $text, kids: $kids)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.text, text) || other.text == text) &&
            const DeepCollectionEquality().equals(other._kids, _kids));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, text, const DeepCollectionEquality().hash(_kids));

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
      required final String text,
      final List<int>? kids}) = _$CommentImpl;

  factory _Comment.fromJson(Map<String, dynamic> json) = _$CommentImpl.fromJson;

  @override
  int get id;
  @override
  String get text;
  @override
  List<int>? get kids;
  @override
  @JsonKey(ignore: true)
  _$$CommentImplCopyWith<_$CommentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
