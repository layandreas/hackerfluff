// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paged_data_state_interface.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PagedDataStateInterface<T> {
  int get currentPage => throw _privateConstructorUsedError;
  List<T> get stories => throw _privateConstructorUsedError;
  int get storiesPerPage => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get reachedEnd => throw _privateConstructorUsedError;
}

/// @nodoc

class _$PagedDataStateInterfaceImpl<T> implements _PagedDataStateInterface<T> {
  const _$PagedDataStateInterfaceImpl(
      {this.currentPage = 0,
      final List<T> stories = const [],
      this.storiesPerPage = 2,
      this.isLoading = false,
      this.reachedEnd = false})
      : _stories = stories;

  @override
  @JsonKey()
  final int currentPage;
  final List<T> _stories;
  @override
  @JsonKey()
  List<T> get stories {
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
    return 'PagedDataStateInterface<$T>(currentPage: $currentPage, stories: $stories, storiesPerPage: $storiesPerPage, isLoading: $isLoading, reachedEnd: $reachedEnd)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PagedDataStateInterfaceImpl<T> &&
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
}

abstract class _PagedDataStateInterface<T>
    implements PagedDataStateInterface<T> {
  const factory _PagedDataStateInterface(
      {final int currentPage,
      final List<T> stories,
      final int storiesPerPage,
      final bool isLoading,
      final bool reachedEnd}) = _$PagedDataStateInterfaceImpl<T>;

  @override
  int get currentPage;
  @override
  List<T> get stories;
  @override
  int get storiesPerPage;
  @override
  bool get isLoading;
  @override
  bool get reachedEnd;
}
