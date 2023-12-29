import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'sample_feature/sample_item_details_view.dart';
import 'sample_feature/sample_item_list_view.dart';
import 'settings/settings_controller.dart';
import 'settings/settings_view.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:freezed_annotation/freezed_annotation.dart';

// Necessary for code-generation to work
part 'app.g.dart';

part 'app.freezed.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.settingsController,
  });

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    // Glue the SettingsController to the MaterialApp.
    //
    // The ListenableBuilder Widget listens to the SettingsController for changes.
    // Whenever the user updates their settings, the MaterialApp is rebuilt.
    return ListenableBuilder(
      listenable: settingsController,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          // Providing a restorationScopeId allows the Navigator built by the
          // MaterialApp to restore the navigation stack when a user leaves and
          // returns to the app after it has been killed while running in the
          // background.
          restorationScopeId: 'app',

          // Provide the generated AppLocalizations to the MaterialApp. This
          // allows descendant Widgets to display the correct translations
          // depending on the user's locale.
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', ''), // English, no country code
          ],

          // Use AppLocalizations to configure the correct application title
          // depending on the user's locale.
          //
          // The appTitle is defined in .arb files found in the localization
          // directory.
          onGenerateTitle: (BuildContext context) =>
              AppLocalizations.of(context)!.appTitle,

          // Define a light and dark color theme. Then, read the user's
          // preferred ThemeMode (light, dark, or system default) from the
          // SettingsController to display the correct theme.
          theme: ThemeData(),
          darkTheme: ThemeData.dark(),
          themeMode: settingsController.themeMode,

          // Define a function to handle named routes in order to support
          // Flutter web url navigation and deep linking.
          onGenerateRoute: (RouteSettings routeSettings) {
            return MaterialPageRoute<void>(
              settings: routeSettings,
              builder: (BuildContext context) {
                //return const MyWidget();
                switch (routeSettings.name) {
                  case SettingsView.routeName:
                    return SettingsView(controller: settingsController);
                  case SampleItemDetailsView.routeName:
                    return const SampleItemDetailsView();
                  //case SampleItemListView.routeName:
                  case '/placeholder':
                    return const CommentsView();
                  default:
                    return const MyWidget();
                }
              },
            );
          },
        );
      },
    );
  }
}

@freezed
class TopStories with _$TopStories {
  factory TopStories({required List<int> storyIds}) = _TopStories;

  /// Convert a JSON object into an [TopStories] instance.
  /// This enables type-safe reading of the API response.
  factory TopStories.fromJson(Map<String, List<dynamic>> json) =>
      _$TopStoriesFromJson(json);
}

@riverpod
Future<TopStories> topStories(TopStoriesRef ref) async {
  // Using package:http, we fetch a random activity from the Bored API.
  final response = await http
      .get(Uri.https('hacker-news.firebaseio.com', '/v0/topstories.json'));
  // Using dart:convert, we then decode the JSON payload into a Map data structure.
  final json = jsonDecode(response.body) as List<dynamic>;
  // Finally, we convert the Map into an Activity instance.
  return TopStories.fromJson({'storyIds': json.sublist(0, 5)});
}

@freezed
class Story with _$Story {
  const factory Story({
    required String title,
    List<int>? kids,
  }) = _Story;

  factory Story.fromJson(Map<String, Object?> json) => _$StoryFromJson(json);
}

@riverpod
Stream<List<Story>> story(StoryRef ref) async* {
  final topStories = await ref.watch(topStoriesProvider.future);
  //var client = http.Client();

  var allResponsesFuture = <Future>[];
  var allResponses = <dynamic>[];
  try {
    for (final storyId in topStories.storyIds) {
      var response = http.get(
          Uri.https('hacker-news.firebaseio.com', '/v0/item/$storyId.json'));
      allResponsesFuture.add(response);
    }
    allResponses = await Future.wait(allResponsesFuture);
  } finally {
    //client.close();
  }

  //var allResponses = await Future.wait(allResponsesFuture);
  var allTopStories = const <Story>[];

  for (final response in allResponses) {
    var json = jsonDecode(response.body);
    var topStory = Story.fromJson(json);
    allTopStories = [...allTopStories, topStory];
    yield allTopStories;
  }

  // var allTopStories = const <Story>[];
  // try {
  //   for (final storyId in topStories.storyIds) {
  //     var response = await client.get(
  //         Uri.https('hacker-news.firebaseio.com', '/v0/item/$storyId.json'));
  //     var json = jsonDecode(response.body);
  //     var topStory = Story.fromJson(json);
  //     allTopStories = [...allTopStories, topStory];
  //     yield allTopStories;
  //   }
  // } finally {
  //   client.close();
  // }
}

@freezed
class Comment with _$Comment {
  const factory Comment({
    required String id,
    required String text,
  }) = _Comment;

  factory Comment.fromJson(Map<String, Object?> json) =>
      _$CommentFromJson(json);
}

class CommentModel {
  final String id;
  final String text;
  List<CommentModel> children;

  CommentModel(this.id, this.text, this.children);
}

// @riverpod
// Future<List<Comment>> comment(CommentRef ref, Story story) async {
//   for (final kid in story.kids ?? <List<int>>[]) {
//     ;
//   }
// }

class MyWidget extends ConsumerWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allTopStories = ref.watch(storyProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Top Stories')),
      body: SafeArea(
        child: switch (allTopStories) {
          // Display all the messages in a scrollable list view.
          AsyncData(:final value) => ListView.builder(
              // Show messages from bottom to top
              itemCount: value.length,
              itemBuilder: (context, index) {
                final message = value[index];
                // return ListTile(
                //   title: Text(message.title),
                // );
                return Card(
                    child: ListTile(
                  title: Text(message.title),
                  onTap: () {
                    Navigator.restorablePushNamed(
                        context, CommentsView.routeName);
                  },
                ));
              },
            ),
          AsyncError(:final error) => Text(error.toString()),
          _ => const CircularProgressIndicator(),
        },
      ),
    );

    // return SafeArea(
    //   child: ListView(
    //     padding: const EdgeInsets.all(8),
    //     children: <Widget>[
    //       switch (topStories) {
    //         AsyncData(:final value) => Text(value.toString()),
    //         AsyncError() => Text(topStories.error.toString()),
    //         _ => const CircularProgressIndicator()
    //       }
    //     ],
    //   ),
    //);
  }
}

class TestSingleCommentsView extends StatelessWidget {
  final CommentModel comment;
  final bool isParentWidget;
  const TestSingleCommentsView(
      {super.key, required this.comment, this.isParentWidget = false});

  @override
  Widget build(BuildContext context) {
    // return Text(comment.text);
    // return ListView.builder(
    //     itemCount: comment.children.length,
    //     itemBuilder: (context, index) {
    //       return Text(comment.children[index].text);
    //     });
    // return Column(
    //   children: [
    //     Padding(padding: EdgeInsets.all(120.0), child: Text(comment.text)),
    //     for (final child in comment.children)
    //       TestSingleCommentsView(comment: child)
    //   ],
    // );
    switch (isParentWidget) {
      case true:
        return Column(
          children: [
            Text(comment.text),
            for (final child in comment.children)
              TestSingleCommentsView(comment: child)
          ],
        );
      case false:
        return Row(
          children: [
            Text(comment.text),
            for (final child in comment.children)
              TestSingleCommentsView(comment: child)
          ],
        );
      // return Padding(
      //   padding: const EdgeInsets.only(left: 50.0),
      //   child: Column(
      //     children: [
      //       Text(comment.text),
      //       for (final child in comment.children)
      //         TestSingleCommentsView(comment: child)
      //     ],
      //   ),
      // );
    }
  }
}

final comment = CommentModel('1', 'comment1', [
  CommentModel('2', 'comment2',
      <CommentModel>[CommentModel('4', 'comment4', <CommentModel>[])]),
  CommentModel('3', 'comment3', <CommentModel>[])
]);

class CommentsView extends StatelessWidget {
  const CommentsView({super.key});

  static const routeName = '/placeholder';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Comments')),
        body: TestSingleCommentsView(
          comment: comment,
          isParentWidget: true,
        ));
  }
}


// class CommentsView extends StatelessWidget {
//   const CommentsView({super.key});

//   static const routeName = '/placeholder';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(title: const Text('Comments')),
//         body: const Text('test'));
//   }
// }
