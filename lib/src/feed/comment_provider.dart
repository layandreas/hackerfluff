import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'comment_model.dart';
import 'page_stories_state_model.dart';

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
  PagedStoriesState build(int storyId) {
    return const PagedStoriesState(
        currentPage: 0,
        stories: [],
        storiesPerPage: 10,
        isLoading: false,
        reachedEnd: false);
  }

  // @override
  // fetchStories() async {
  //   final topStories = await ref.watch(topStoriesProvider.future);
  //   final storyStartIndex = state.currentPage * state.storiesPerPage;
  //   final storyEndIndex = storyStartIndex + state.storiesPerPage;

  //   if (state.isLoading) {
  //     return;
  //   }

  //   state = state.copyWith(
  //       isLoading: true,
  //       reachedEnd:
  //           storyStartIndex > topStories.storyIds.length - 1 ? true : false);

  //   if (state.reachedEnd) {
  //     state = state.copyWith(isLoading: false);

  //     return;
  //   }

  //   final topStoriesOnPage = topStories.storyIds.sublist(
  //       storyStartIndex, min(storyEndIndex, topStories.storyIds.length));

  //   var allResponsesFuture = <Future>[];
  //   for (final storyId in topStoriesOnPage) {
  //     var response = http.get(
  //         Uri.https('hacker-news.firebaseio.com', '/v0/item/$storyId.json'));
  //     allResponsesFuture.add(response);
  //   }
  //   final allResponses = await Future.wait(allResponsesFuture);

  //   //var allResponses = await Future.wait(allResponsesFuture);
  //   var allTopStories = const <Story>[];

  //   for (final response in allResponses) {
  //     var json = jsonDecode(response.body);
  //     var topStory = Story.fromJson(json);
  //     allTopStories = [...allTopStories, topStory];
  //   }

  //   state = state.copyWith(
  //       currentPage: state.currentPage + 1,
  //       stories: [...state.stories, ...allTopStories],
  //       isLoading: false);
  // }
}
