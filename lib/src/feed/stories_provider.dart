import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'dart:math';

import 'page_stories_state_model.dart';
import 'top_stories_provider.dart';
import 'story_model.dart';
import '../storage/db_provider.dart';

// Necessary for code-generation to work
part 'stories_provider.g.dart';

interface class FetchingNotifier {
  fetchStories() {}
}

@Riverpod(keepAlive: true)
class Stories extends _$Stories implements FetchingNotifier {
  @override
  PagedStoriesState build(StoryListEndpoint storyListEndpoint) {
    const state = PagedStoriesState(
        currentPage: 0,
        stories: [],
        storiesPerPage: 10,
        isLoading: false,
        reachedEnd: false);

    return state;
  }

  @override
  void fetchStories() async {
    final topStories =
        await ref.watch(topStoriesProvider(storyListEndpoint).future);
    final db = await ref.watch(databaseProvider.future);
    final storyStartIndex = state.currentPage * state.storiesPerPage;
    final storyEndIndex = storyStartIndex + state.storiesPerPage;

    if (state.isLoading) {
      return;
    }

    state = state.copyWith(
        isLoading: true,
        reachedEnd:
            storyStartIndex > topStories.storyIds.length - 1 ? true : false);
    try {
      if (state.reachedEnd) {
        state = state.copyWith(isLoading: false);

        return;
      }

      final topStoriesOnPage = topStories.storyIds.sublist(
          storyStartIndex, min(storyEndIndex, topStories.storyIds.length));

      var allResponsesFuture = <Future>[];
      var allNCommentsSeenFuture = <Future<List<Map<String, Object?>>>>[];
      for (final storyId in topStoriesOnPage) {
        var response = http.get(
            Uri.https('hacker-news.firebaseio.com', '/v0/item/$storyId.json'));
        allResponsesFuture.add(response);

        var nCommentsSeen =
            db.rawQuery("select sum(comment_was_seen) as nCommentsSeen "
                "from comments where story_id=$storyId group by story_id");
        allNCommentsSeenFuture.add(nCommentsSeen);
      }
      final allResponses = await Future.wait(allResponsesFuture);
      final allNCommentsSeen = await Future.wait(allNCommentsSeenFuture);

      var allTopStories = const <Story>[];
      for (int i = 0; i <= allResponses.length - 1; i++) {
        var json = jsonDecode(allResponses[i].body);
        var topStory = Story.fromJson(json);
        if (allNCommentsSeen[i].length == 1) {
          var nCommentsSeen = allNCommentsSeen[i][0]["nCommentsSeen"] as int;
          topStory = topStory.copyWith(nCommentsSeen: nCommentsSeen);
        }
        allTopStories = [...allTopStories, topStory];
      }

      state = state.copyWith(
          currentPage: state.currentPage + 1,
          stories: [...state.stories, ...allTopStories],
          isLoading: false);
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }
}
