import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../feed/top_stories_provider.dart';
import '../feed/bottom_bar.dart';
import '../feed/feed_view.dart';
import '../widgets/scaffold.dart' show customScaffold;

class BookmarksView extends ConsumerWidget {
  const BookmarksView({super.key});

  static const routeName = '/bookmarks';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return customScaffold(
      context: context,
      body: const BottomBar(
        child: FeedViewSkeleton(
          storyListEndpoint: StoryListEndpoint.bookmarks,
          invalidateBookmarkProvider: false,
          collapseOnBookmarkRemoval: true,
        ),
      ),
      title: Text('Bookmarks',
          style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold)),
    );
  }
}
