import 'package:freezed_annotation/freezed_annotation.dart';

// Necessary for code-generation to work
part 'comment_model.g.dart';
part 'comment_model.freezed.dart';

@freezed
class Comment with _$Comment {
  const factory Comment({
    required int id,
    required String? text,
    List<int>? kids,
  }) = _Comment;

  factory Comment.fromJson(Map<String, Object?> json) =>
      _$CommentFromJson(json);
}

@freezed
class CommentModel with _$CommentModel {
  const factory CommentModel({
    required int id,
    String? text,
    List<CommentModel>? children,
  }) = _CommentModel;

  factory CommentModel.fromJson(Map<String, Object?> json) =>
      _$CommentModelFromJson(json);
}

// class CommentModel {
//   final int id;
//   final String text;
//   List<CommentModel> children;

//   CommentModel(this.id, this.text, this.children);
// }
