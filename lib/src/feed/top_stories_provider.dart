import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import 'top_stories_model.dart';

part 'top_stories_provider.g.dart';

enum StoryListEndpoint {
  topstories,
  newstories,
  beststories,
  askstories,
  showstories,
  jobstories
}

@Riverpod(keepAlive: true)
Future<TopStories> topStories(
    TopStoriesRef ref, StoryListEndpoint storyListEndPoint) async {
  // Using package:http, we fetch a random activity from the Bored API.
  final response = await http.get(Uri.https(
      'hacker-news.firebaseio.com', '/v0/${storyListEndPoint.name}.json'));
  // Using dart:convert, we then decode the JSON payload into a Map data structure.
  final json = jsonDecode(response.body) as List<dynamic>;
  // Finally, we convert the Map into an Activity instance.
  return TopStories.fromJson({'storyIds': json});
}
