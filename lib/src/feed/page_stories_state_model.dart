import 'package:freezed_annotation/freezed_annotation.dart';
import 'story_model.dart';
import 'paged_data_state_interface.dart';

// Necessary for code-generation to work
part 'page_stories_state_model.freezed.dart';
part 'page_stories_state_model.g.dart';

@freezed
class PagedStoriesState
    with _$PagedStoriesState
    implements PagedDataStateInterface<Story> {
  const factory PagedStoriesState({
    @Default(0) int currentPage,
    @Default([]) List<Story> stories,
    @Default(2) int storiesPerPage,
    @Default(false) bool isLoading,
    @Default(false) bool reachedEnd,
    @Default(0) int nErrors,
  }) = _PagedStoriesState;

  factory PagedStoriesState.fromJson(Map<String, dynamic> json) =>
      _$PagedStoriesStateFromJson(json);
}
