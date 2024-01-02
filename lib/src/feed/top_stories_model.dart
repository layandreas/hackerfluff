import 'package:freezed_annotation/freezed_annotation.dart';

// Necessary for code-generation to work
part 'top_stories_model.g.dart';
part 'top_stories_model.freezed.dart';

@freezed
class TopStories with _$TopStories {
  factory TopStories({required List<int> storyIds}) = _TopStories;

  /// Convert a JSON object into an [TopStories] instance.
  /// This enables type-safe reading of the API response.
  factory TopStories.fromJson(Map<String, List<dynamic>> json) =>
      _$TopStoriesFromJson(json);
}
