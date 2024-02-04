import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../feed/stories_provider.dart';
import '../feed/top_stories_provider.dart';
import '../feed/endless_scroll_view.dart';
import '../feed/comments_feed_view.dart';
import '../feed/story_view.dart';
import '../feed/bottom_bar.dart';

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
        child: _FeedView(
          storyListEndpoint: StoryListEndpoint.topstories,
        ),
      ),
    );
  }
}

class _FeedView extends ConsumerStatefulWidget {
  const _FeedView({required this.storyListEndpoint});

  final StoryListEndpoint storyListEndpoint;

  @override
  ConsumerState<_FeedView> createState() => _FeedViewState();
}

class _FeedViewState extends ConsumerState<_FeedView>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final storiesState = ref.watch(storiesProvider(widget.storyListEndpoint));
    final storiesNotifier =
        ref.read(storiesProvider(widget.storyListEndpoint).notifier);

    return EndlessScrollView(
      key: Key(widget.storyListEndpoint.name),
      storiesState: storiesState,
      dataFetcher: () => storiesNotifier.fetchStories(),
      refreshCallback: () =>
          ref.refresh(topStoriesProvider(widget.storyListEndpoint).future),
      itemBuilder: (index, storiesState) {
        return GestureDetector(
          child: StoryView(
              key: ValueKey(index), story: storiesState.stories[index]),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CommentsFeedView(
                          story: storiesState.stories[index],
                        )));
          },
        );
      },
    );
  }
}
