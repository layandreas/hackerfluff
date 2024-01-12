import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'comment_status_model.dart';
import '../storage/db_provider.dart';
import 'n_comments_seen_provider.dart';

// Necessary for code-generation to work
part 'comment_status_provider.g.dart';

@riverpod
class CommentStatus extends _$CommentStatus {
  @override
  FutureOr<CommentStatusModel> build(int id) async {
    final CommentStatusModel commentStatus;

    final db = ref.read(databaseProvider);

    switch (db) {
      case AsyncError():
        commentStatus = CommentStatusModel(id: id, commentWasSeen: 0);
        return commentStatus;

      case AsyncValue(:final value):
        List<
            Map<String,
                Object?>> commentStatusFromQuery = await value!.rawQuery(
            "select id, comment_was_seen as commentWasSeen from comments where id=$id");

        if (commentStatusFromQuery.length == 1) {
          commentStatus =
              CommentStatusModel.fromJson(commentStatusFromQuery[0]);
          return commentStatus;
        } else {
          commentStatus = CommentStatusModel(id: id, commentWasSeen: 0);
          return commentStatus;
        }
    }
  }

  void insertCommentStatus(
      {required int id,
      required int commentWasSeen,
      required int storyId}) async {
    final db = ref.read(databaseProvider);

    switch (db) {
      case AsyncError():
        return;

      case AsyncValue(:final value):
        await value!.transaction((txn) async {
          await txn.rawInsert(
              'insert or replace into comments(id, story_id, comment_was_seen) values($id, $storyId, $commentWasSeen)');
        });
        ref.invalidate(nCommentsSeenProvider(storyId));
    }
  }
}
