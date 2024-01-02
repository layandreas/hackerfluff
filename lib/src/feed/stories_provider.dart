import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'dart:math';

import 'page_stories_state_model.dart';
import 'top_stories_provider.dart';
import 'story_model.dart';

// Necessary for code-generation to work
part 'stories_provider.g.dart';

@riverpod
class Stories extends _$Stories {
  @override
  PagedStoriesState build() {
    return const PagedStoriesState(
        currentPage: 0,
        stories: [],
        storiesPerPage: 10,
        isLoading: false,
        reachedEnd: false);
  }

  fetchStories() async {
    final topStories = await ref.watch(topStoriesProvider.future);
    final storyStartIndex = state.currentPage * state.storiesPerPage;
    final storyEndIndex = storyStartIndex + state.storiesPerPage;

    state = state.copyWith(
        isLoading: true,
        reachedEnd:
            storyStartIndex > topStories.storyIds.length - 1 ? true : false);

    if (state.reachedEnd) {
      state = state.copyWith(isLoading: false);

      return;
    }

    final topStoriesOnPage = topStories.storyIds.sublist(
        storyStartIndex, min(storyEndIndex, topStories.storyIds.length - 1));

    var allResponsesFuture = <Future>[];
    for (final storyId in topStoriesOnPage) {
      var response = http.get(
          Uri.https('hacker-news.firebaseio.com', '/v0/item/$storyId.json'));
      allResponsesFuture.add(response);
    }
    final allResponses = await Future.wait(allResponsesFuture);

    //var allResponses = await Future.wait(allResponsesFuture);
    var allTopStories = const <Story>[];

    for (final response in allResponses) {
      var json = jsonDecode(response.body);
      var topStory = Story.fromJson(json);
      allTopStories = [...allTopStories, topStory];
    }

    state = state.copyWith(
        currentPage: state.currentPage + 1,
        stories: [...state.stories, ...allTopStories],
        isLoading: false);
  }
}