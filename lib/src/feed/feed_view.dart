import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'stories_provider.dart';
import 'top_stories_provider.dart';
import 'endless_scroll_view.dart';
import 'comments_feed_view.dart';
import 'story_view.dart';
import 'bottom_bar.dart';

class FeedView extends ConsumerWidget {
  const FeedView({super.key});

  static const routeName = '/feed';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
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
        body: const BottomBar(
          child: TabBarView(
            children: [
              FeedViewSkeleton(
                storyListEndpoint: StoryListEndpoint.topstories,
              ),
              FeedViewSkeleton(
                storyListEndpoint: StoryListEndpoint.beststories,
              ),
              FeedViewSkeleton(
                storyListEndpoint: StoryListEndpoint.newstories,
              ),
              FeedViewSkeleton(
                storyListEndpoint: StoryListEndpoint.showstories,
              ),
              FeedViewSkeleton(
                storyListEndpoint: StoryListEndpoint.askstories,
              ),
              FeedViewSkeleton(
                storyListEndpoint: StoryListEndpoint.jobstories,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FeedViewSkeleton extends ConsumerStatefulWidget {
  const FeedViewSkeleton({super.key, required this.storyListEndpoint});

  final StoryListEndpoint storyListEndpoint;

  @override
  ConsumerState<FeedViewSkeleton> createState() => _FeedViewState();
}

class _FeedViewState extends ConsumerState<FeedViewSkeleton>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final storiesState = ref.watch(storiesProvider(widget.storyListEndpoint));
    final storiesNotifier =
        ref.read(storiesProvider(widget.storyListEndpoint).notifier);
    final bookmarkedStories =
        ref.watch(topStoriesProvider(StoryListEndpoint.bookmarks)).value;
    final bookmarkedStoriesNotifier =
        ref.watch(topStoriesProvider(StoryListEndpoint.bookmarks).notifier);

    return EndlessScrollView(
      key: Key(widget.storyListEndpoint.name),
      storiesState: storiesState,
      dataFetcher: () => storiesNotifier.fetchStories(),
      refreshCallback: () =>
          ref.refresh(topStoriesProvider(widget.storyListEndpoint).future),
      itemBuilder: (index, storiesState) {
        return GestureDetector(
          child: StoryView(
            key: ValueKey(index),
            story: storiesState.stories[index],
            isBookmarked: bookmarkedStories?.storyIds
                    .contains(storiesState.stories[index].id) ??
                false,
          ),
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
