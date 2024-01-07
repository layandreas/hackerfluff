import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'stories_provider.dart';
import 'top_stories_provider.dart';
import 'endless_scroll_view.dart';
import 'comments_feed_view.dart';
import 'story_view.dart';

class FeedView extends ConsumerWidget {
  const FeedView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final storiesState = ref.watch(storiesProvider);
    final storiesNotifier = ref.read(storiesProvider.notifier);

    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
          bottom: const TabBar(
            labelPadding: EdgeInsets.all(7),
            isScrollable: true,
            tabs: [
              Text('Top'),
              Text('Best'),
              Text('New'),
              Text('Show'),
              Text('Ask'),
              Text('Jobs'),
            ],
            tabAlignment: TabAlignment.center,
          ),
        ),
        body: EndlessScrollView(
          storiesState: storiesState,
          dataFetcher: () => storiesNotifier.fetchStories(),
          refreshCallback: () => ref.refresh(topStoriesProvider.future),
          itemBuilder: (index, storiesState) {
            return GestureDetector(
              child: StoryView(story: storiesState.stories[index]),
              onTap: () {
                Navigator.restorablePushNamed(
                    context, CommentsFeedView.routeName,
                    arguments: storiesState.stories[index].toJson());
              },
            );
          },
        ),
      ),
    );
  }
}
