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
          scrolledUnderElevation: 0,
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
          toolbarHeight: 35,
          title: Text('Stories',
              style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold)),
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

class _FeedViewState extends ConsumerState<FeedViewSkeleton> {
  List<int> collapsedToHeightZero = [];

  void addToCollapsedStories({required int storyId}) {
    setState(() {
      collapsedToHeightZero.add(storyId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final storiesState = ref.watch(storiesProvider(widget.storyListEndpoint));
    final storiesNotifier =
        ref.read(storiesProvider(widget.storyListEndpoint).notifier);
    final bookmarkedStories =
        ref.watch(topStoriesProvider(StoryListEndpoint.bookmarks)).value;
    final bookmarkedStoriesNotifier =
        ref.watch(topStoriesProvider(StoryListEndpoint.bookmarks).notifier);

    // Needed so bookmarks page is refreshed when accessing comments
    // view from bookmarks page and then returning
    if (storiesState.stories.isEmpty &&
        !storiesState.isLoading &&
        !storiesState.reachedEnd) {
      Future(storiesNotifier.fetchStories);
    }

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

    return Column(
      children: [
        Expanded(
          child: EndlessScrollView(
            key: Key(widget.storyListEndpoint.name),
            storiesState: storiesState,
            dataFetcher: () => storiesNotifier.fetchStories(),
            refreshCallback: () => ref
                .refresh(topStoriesProvider(widget.storyListEndpoint).future),
            topOfListWidgets: const [
              SizedBox(
                height: 6,
              )
            ],
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
                  isCollapsedToHeightZero: collapsedToHeightZero
                      .contains(storiesState.stories[index].id),
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
          ),
        ),
      ],
    );
  }
}
