import 'package:freezed_annotation/freezed_annotation.dart';
import 'comment_model.dart';
import 'paged_data_state_interface.dart';

// Necessary for code-generation to work
part 'paged_comments_state_model.freezed.dart';

@freezed
class PagedCommentsState
    with _$PagedCommentsState
    implements PagedDataStateInterface<Comment> {
  const factory PagedCommentsState({
    @Default(0) int currentPage,
    @Default([]) List<CommentModelFlat> stories,
    @Default(2) int storiesPerPage,
    @Default(false) bool isLoading,
    @Default(false) bool reachedEnd,
  }) = _PagedCommentsState;
}

// @freezed
// class PagedCommentsStateFlat
//     with _$PagedCommentsStateFlat
//     implements PagedDataStateInterface<Comment> {
//   const factory PagedCommentsStateFlat({
//     @Default(0) int currentPage,
//     @Default([]) List<CommentModelFlat> stories,
//     @Default(2) int storiesPerPage,
//     @Default(false) bool isLoading,
//     @Default(false) bool reachedEnd,
//   }) = _PagedCommentsStateFlat;
// }
