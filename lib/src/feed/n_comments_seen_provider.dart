import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'dart:async';

import '../storage/db_provider.dart';

// Necessary for code-generation to work
part 'n_comments_seen_provider.g.dart';

@riverpod
Future<int> nCommentsSeen(NCommentsSeenRef ref, int? storyId) async {
  final db = await ref.watch(databaseProvider.future);
  final List<Map<String, Object?>> nCommentsSeenResponse;

  if (storyId != null) {
    nCommentsSeenResponse =
        await db.rawQuery("select sum(comment_was_seen) as nCommentsSeen "
            "from comments where story_id=$storyId group by story_id");
  } else {
    nCommentsSeenResponse =
        await db.rawQuery("select sum(comment_was_seen) as nCommentsSeen "
            "from comments");
  }

  if (nCommentsSeenResponse.length == 1) {
    final nCommentsSeen = nCommentsSeenResponse[0]["nCommentsSeen"] as int;
    return nCommentsSeen;
  }

  return 0;
}
