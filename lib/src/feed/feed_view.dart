import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'stories_provider.dart';
import 'top_stories_provider.dart';
import 'endless_scroll_view.dart';
import 'comments_feed_view.dart';

class FeedView extends ConsumerWidget {
  const FeedView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final storiesState = ref.watch(storiesProvider);
    final storiesNotifier = ref.read(storiesProvider.notifier);

    return EndlessScrollView(
      title: 'Top Stories',
      storiesState: storiesState,
      dataFetcher: () => storiesNotifier.fetchStories(),
      refreshCallback: () => ref.refresh(topStoriesProvider.future),
      itemBuilder: (index, storiesState) {
        return Card(
            child: ListTile(
          title: Text(storiesState.stories[index].title),
          onTap: () {
            Navigator.restorablePushNamed(context, CommentsFeedView.routeName,
                arguments: storiesState.stories[index].toJson());
          },
        ));
      },
    );
  }
}
