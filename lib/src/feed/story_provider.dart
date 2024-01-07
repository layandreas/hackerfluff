import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'story_model.dart';
import 'top_stories_provider.dart';

// Necessary for code-generation to work
part 'story_provider.g.dart';

@riverpod
Stream<List<Story>> story(
    StoryRef ref, StoryListEndpoint storyListEndPoint) async* {
  final topStories =
      await ref.watch(topStoriesProvider(storyListEndPoint).future);

  var allResponsesFuture = <Future>[];
  var allResponses = <dynamic>[];
  for (final storyId in topStories.storyIds) {
    var response = http
        .get(Uri.https('hacker-news.firebaseio.com', '/v0/item/$storyId.json'));
    allResponsesFuture.add(response);
  }
  allResponses = await Future.wait(allResponsesFuture);

  //var allResponses = await Future.wait(allResponsesFuture);
  var allTopStories = const <Story>[];

  for (final response in allResponses) {
    var json = jsonDecode(response.body);
    var topStory = Story.fromJson(json);
    allTopStories = [...allTopStories, topStory];
    yield allTopStories;
  }
}
