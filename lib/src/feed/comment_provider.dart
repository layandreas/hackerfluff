import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'comment_model.dart';
import 'story_model.dart';
import 'paged_comments_state_model.dart';

// Necessary for code-generation to work
part 'comment_provider.g.dart';

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

@riverpod
class Comments extends _$Comments {
  @override
  PagedCommentsState build(Story story) {
    state = const PagedCommentsState(
        currentPage: 0,
        stories: [],
        storiesPerPage: 5,
        isLoading: false,
        reachedEnd: false);

    return state;
  }

  void fetchStories() async {
    final List<int> kids = story.kids ?? [];
    final commentStartIndex = state.currentPage * state.storiesPerPage;
    final commentEndIndex = commentStartIndex + state.storiesPerPage;

    if (state.isLoading) {
      return;
    }

    state = state.copyWith(
        isLoading: true,
        reachedEnd: commentStartIndex > kids.length - 1 ? true : false);

    if (state.reachedEnd) {
      state = state.copyWith(isLoading: false);

      return;
    }

    final commentsOnPage =
        kids.sublist(commentStartIndex, min(commentEndIndex, kids.length));

    var allCommentModelsFuture = <Future<CommentModel>>[];
    for (final kid in commentsOnPage) {
      var commentModel = fetchCommentTree(kid);
      allCommentModelsFuture.add(commentModel);
    }
    final allCommentModels = await Future.wait(allCommentModelsFuture);

    state = state.copyWith(
        currentPage: state.currentPage + 1,
        stories: [...state.stories, ...allCommentModels],
        isLoading: false);
  }
}
