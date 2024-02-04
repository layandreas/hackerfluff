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
        title: const Text('Bookmarks'),
      ),
      body: const BottomBar(
        child: FeedViewSkeleton(
          storyListEndpoint: StoryListEndpoint.bookmarks,
        ),
      ),
    );
  }
}
