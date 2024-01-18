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
    required String? by,
    required int? time,
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
    required String? by,
    required int? time,
  }) = _CommentModel;

  factory CommentModel.fromJson(Map<String, Object?> json) =>
      _$CommentModelFromJson(json);
}

@freezed
class CommentModelFlat with _$CommentModelFlat {
  const factory CommentModelFlat({
    required int id,
    String? text,
    int? parentId,
    int? nParents,
    int? nChildren,
    List<int>? children,
    required String? by,
    required int? time,
  }) = _CommentModelFlat;

  factory CommentModelFlat.fromJson(Map<String, Object?> json) =>
      _$CommentModelFlatFromJson(json);
}
