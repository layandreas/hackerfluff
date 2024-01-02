import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'comment_model.dart';

Future<CommentModel> fetchCommentTree(int id) async {
  final response = await http
      .get(Uri.https('hacker-news.firebaseio.com', '/v0/item/$id.json'));
  final json = jsonDecode(response.body);
  var comment = Comment.fromJson(json);
  var commentAsModel = CommentModel.fromJson(json);

  List<Future<CommentModel>> childrenFutures = [];
  for (var childId in comment.kids ?? []) {
    var childCommentFuture = fetchCommentTree(childId);
    childrenFutures.add(childCommentFuture);
  }
  final children = await Future.wait(childrenFutures);

  commentAsModel = commentAsModel.copyWith(children: children);

  return commentAsModel;
}
