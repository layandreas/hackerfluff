import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../feed/top_stories_provider.dart';
import '../feed/bottom_bar.dart';
import '../feed/feed_view.dart';

class BookmarksView extends ConsumerWidget {
  const BookmarksView({super.key});

  static const routeName = '/bookmarks';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        leading: ModalRoute.of(context)?.canPop == true
            ? IconButton(
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  size: 15,
                  color: Theme.of(context).colorScheme.primary,
                ),
                onPressed: () => Navigator.of(context).pop(),
// used onPressed here
              )
            : null,
        title: Text('Bookmarks',
            style: TextStyle(color: Theme.of(context).colorScheme.primary)),
      ),
      body: const BottomBar(
        child: FeedViewSkeleton(
          storyListEndpoint: StoryListEndpoint.bookmarks,
          invalidateBookmarkProvider: false,
          collapseOnBookmarkRemoval: true,
        ),
      ),
    );
  }
}
