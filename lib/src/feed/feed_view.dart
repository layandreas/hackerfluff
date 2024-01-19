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
