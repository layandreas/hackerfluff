import 'package:freezed_annotation/freezed_annotation.dart';

// Necessary for code-generation to work
part 'comment_status_model.freezed.dart';
part 'comment_status_model.g.dart';

@freezed
class CommentStatusModel with _$CommentStatusModel {
  const factory CommentStatusModel({
    required int id,
    required int commentWasSeen,
  }) = _CommentStatusModel;

  factory CommentStatusModel.fromJson(Map<String, Object?> json) =>
      _$CommentStatusModelFromJson(json);
}
