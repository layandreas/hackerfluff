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
  try {
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
  } catch (e) {
    return const CommentModel(
        by: '', id: -1, text: null, children: [], time: 0);
  }
}

CommentModelFlat commentModelToCommentModelFlat(
    {required CommentModel commentModel,
    int? parentId,
    required int nParents}) {
  return CommentModelFlat(
      id: commentModel.id,
      text: commentModel.text,
      parentId: parentId,
      nParents: nParents,
      children: commentModel.children?.map((x) => x.id).toList(),
      nChildren: commentModel.children?.length ?? 0,
      by: commentModel.by,
      time: commentModel.time);
}

List<CommentModelFlat> flattenCommentModel(
    {required CommentModel commentModel,
    required int nestingLevel,
    int? parentId}) {
  var nChildren = commentModel.children?.length ?? 0;
  List<CommentModelFlat> commentModelsFlatList = [];
  for (final child in commentModel.children ?? <CommentModel>[]) {
    var flattenedChild = flattenCommentModel(
        commentModel: child,
        nestingLevel: nestingLevel + 1,
        parentId: commentModel.id);
    nChildren += flattenedChild
        .map((e) => e.children?.length ?? 0)
        .reduce((a, b) => a + b);
    commentModelsFlatList.addAll(flattenedChild);
  }
  final commentModelFlatParent = commentModelToCommentModelFlat(
    commentModel: commentModel,
    parentId: parentId,
    nParents: nestingLevel,
  );
  commentModelsFlatList.insert(
      0, commentModelFlatParent.copyWith(nChildren: nChildren));

  return commentModelsFlatList;
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

    try {
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

      final List<CommentModelFlat> allCommentModelsFlat = [];
      for (final commentModel in allCommentModels) {
        var commentModelFlat =
            flattenCommentModel(commentModel: commentModel, nestingLevel: 0);
        allCommentModelsFlat.addAll(commentModelFlat);
      }

      state = state.copyWith(
          currentPage: state.currentPage + 1,
          stories: [...state.stories, ...allCommentModelsFlat],
          isLoading: false);
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }
}
