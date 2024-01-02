import 'package:freezed_annotation/freezed_annotation.dart';

// Necessary for code-generation to work
part 'story_model.g.dart';
part 'story_model.freezed.dart';

@freezed
class Story with _$Story {
  const factory Story({
    required String title,
    List<int>? kids,
  }) = _Story;

  factory Story.fromJson(Map<String, Object?> json) => _$StoryFromJson(json);
}