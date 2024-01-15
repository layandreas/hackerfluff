import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'stories_provider.dart';
import 'top_stories_provider.dart';
import 'endless_scroll_view.dart';
import 'comments_feed_view.dart';
import 'story_view.dart';
import '../settings/settings_view.dart';

class FeedView extends ConsumerWidget {
  const FeedView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        drawer: NavigationDrawer(
            elevation: 0,
            backgroundColor: Theme.of(context).colorScheme.background,
            shadowColor: Colors.transparent,
            children: [
              Card(
                child: ListTile(
                  onTap: () {
                    Navigator.restorablePushNamed(
                      context,
                      SettingsView.routeName,
                    );
                  },
                  leading: const Icon(Icons.settings_outlined),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  title: Text(
                    "Settings",
                    style: TextStyle(
                        fontSize:
                            Theme.of(context).textTheme.bodyLarge?.fontSize),
                  ),
                ),
              )
            ]),
        appBar: AppBar(
          toolbarHeight: 35,
          title: const Text('Stories'),
          bottom: const TabBar(
            labelPadding: EdgeInsets.all(7),
            isScrollable: false,
            tabs: [
              Text('Top'),
              Text('Best'),
              Text('New'),
              Text('Show'),
              Text('Ask'),
              Text('Jobs'),
            ],
            tabAlignment: TabAlignment.fill,
          ),
        ),
        body: const TabBarView(
          children: [
            _FeedView(
              storyListEndpoint: StoryListEndpoint.topstories,
            ),
            _FeedView(
              storyListEndpoint: StoryListEndpoint.beststories,
            ),
            _FeedView(
              storyListEndpoint: StoryListEndpoint.newstories,
            ),
            _FeedView(
              storyListEndpoint: StoryListEndpoint.showstories,
            ),
            _FeedView(
              storyListEndpoint: StoryListEndpoint.askstories,
            ),
            _FeedView(
              storyListEndpoint: StoryListEndpoint.jobstories,
            ),
          ],
        ),
      ),
    );
  }
}

class _FeedView extends ConsumerWidget {
  const _FeedView({required this.storyListEndpoint});

  final StoryListEndpoint storyListEndpoint;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final storiesState = ref.watch(storiesProvider(storyListEndpoint));
    final storiesNotifier =
        ref.read(storiesProvider(storyListEndpoint).notifier);

    return EndlessScrollView(
      storiesState: storiesState,
      dataFetcher: () => storiesNotifier.fetchStories(),
      refreshCallback: () =>
          ref.refresh(topStoriesProvider(storyListEndpoint).future),
      itemBuilder: (index, storiesState) {
        return GestureDetector(
          child: StoryView(story: storiesState.stories[index]),
          onTap: () {
            Navigator.restorablePushNamed(context, CommentsFeedView.routeName,
                arguments: storiesState.stories[index].toJson());
          },
        );
      },
    );
  }
}
