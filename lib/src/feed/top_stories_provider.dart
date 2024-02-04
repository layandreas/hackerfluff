import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import '../storage/db_provider.dart';
import 'top_stories_model.dart';
//import '../storage/db_provider.dart';

part 'top_stories_provider.g.dart';

enum StoryListEndpoint {
  topstories,
  newstories,
  beststories,
  askstories,
  showstories,
  jobstories,
  bookmarks
}

@Riverpod(keepAlive: true)
class TopStories extends _$TopStories {
  @override
  Future<TopStoriesModel> build(StoryListEndpoint storyListEndPoint) async {
    switch (storyListEndPoint) {
      case StoryListEndpoint.bookmarks:
        final topStoriesModel = loadBookmarkedStories();
        return topStoriesModel;

      default:
        final topStoriesModel = loadStoriesFromApi(storyListEndPoint);
        return topStoriesModel;
    }
  }

  Future<TopStoriesModel> loadStoriesFromApi(
      StoryListEndpoint storyListEndPoint) async {
    final response = await http.get(Uri.https(
        'hacker-news.firebaseio.com', '/v0/${storyListEndPoint.name}.json'));
    final json = jsonDecode(response.body) as List<dynamic>;
    return TopStoriesModel.fromJson({'storyIds': json});
  }

  void addBookmarkedStory(
      {required int storyId,
      required String title,
      bool invalidateProvider = true}) async {
    final db = await ref.watch(databaseProvider.future);

    await db.rawInsert(
        'insert or replace into settings(id, title) values(?, ?)',
        [storyId, title]);

    if (invalidateProvider) {
      ref.invalidateSelf();
    }
  }

  Future<TopStoriesModel> loadBookmarkedStories() async {
    //final db = await ref.watch(databaseProvider.future);
    //final List<Map<String, Object?>> bookmarkedStoriesResponse;

    //bookmarkedStories = await db.rawQuery("select id from bookmarks");

    return TopStoriesModel(storyIds: [39251095, 39232717]);
  }
}
