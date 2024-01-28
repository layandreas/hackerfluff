import 'package:freezed_annotation/freezed_annotation.dart';

// Necessary for code-generation to work
part 'top_stories_model.g.dart';
part 'top_stories_model.freezed.dart';

@freezed
class TopStoriesModel with _$TopStoriesModel {
  factory TopStoriesModel({required List<int> storyIds}) = _TopStories;

  /// Convert a JSON object into an [TopStoriesModel] instance.
  /// This enables type-safe reading of the API response.
  factory TopStoriesModel.fromJson(Map<String, List<dynamic>> json) =>
      _$TopStoriesModelFromJson(json);
}
