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
  const FeedViewSkeleton(
      {super.key,
      required this.storyListEndpoint,
      this.invalidateBookmarkProvider = true,
      this.collapseOnBookmarkRemoval = false});

  final StoryListEndpoint storyListEndpoint;
  final bool invalidateBookmarkProvider;
  final bool collapseOnBookmarkRemoval;

  @override
  ConsumerState<FeedViewSkeleton> createState() => _FeedViewState();
}

class _FeedViewState extends ConsumerState<FeedViewSkeleton>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  List<int> collapsedToHeightZero = [];

  void addToCollapsedStories({required int storyId}) {
    setState(() {
      collapsedToHeightZero.add(storyId);
    });
  }

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

    void onAddBookmark({required int storyId, required String title}) {
      bookmarkedStoriesNotifier.addBookmarkedStory(
          storyId: storyId,
          title: title,
          invalidateProvider: widget.invalidateBookmarkProvider);
    }

    void onRemoveBookmark({required int storyId}) {
      bookmarkedStoriesNotifier.removeBookmarkedStory(
          storyId: storyId,
          invalidateProvider: widget.invalidateBookmarkProvider);

      if (widget.collapseOnBookmarkRemoval) {
        addToCollapsedStories(storyId: storyId);
      }
    }

    return EndlessScrollView(
      key: Key(widget.storyListEndpoint.name),
      storiesState: storiesState,
      dataFetcher: () => storiesNotifier.fetchStories(),
      refreshCallback: () =>
          ref.refresh(topStoriesProvider(widget.storyListEndpoint).future),
      itemBuilder: (index, storiesState) {
        return GestureDetector(
          child: StoryView(
            onRemoveBookmark: onRemoveBookmark,
            key: ValueKey(index),
            onAddBookmark: onAddBookmark,
            story: storiesState.stories[index],
            isBookmarked: bookmarkedStories?.storyIds
                    .contains(storiesState.stories[index].id) ??
                false,
            isCollapsedToHeightZero:
                collapsedToHeightZero.contains(storiesState.stories[index].id),
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

  @override
  void deactivate() {
    super.deactivate();
    ref.invalidate(topStoriesProvider(StoryListEndpoint.bookmarks));
  }
}
