import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'story_model.dart';
import 'dart:async';
import 'comments_views.dart';
import 'paged_data_state_interface.dart';
import 'stories_provider.dart';

class EndlessScrollView extends ConsumerStatefulWidget {
  const EndlessScrollView(
      {super.key, required this.dataProvider, required this.refreshProvider});

  final AutoDisposeNotifierProvider dataProvider;
  final AutoDisposeFutureProvider refreshProvider;

  @override
  ConsumerState<EndlessScrollView> createState() => _EndlessScrollViewState();
}

class _EndlessScrollViewState<ProviderT extends FetchingNotifier>
    extends ConsumerState<EndlessScrollView> {
  final scrollController = ScrollController();
  Timer? initialStoryFetchesTimer;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(scrollListener);

    final storiesNotifier = ref.read(widget.dataProvider.notifier);
    (storiesNotifier as ProviderT).fetchStories();
    initialStoryFetchesTimer =
        Timer.periodic(const Duration(milliseconds: 500), initialStoryFetches);
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
    initialStoryFetchesTimer?.cancel();
  }

  void initialStoryFetches(Timer timer) {
    final storiesState =
        ref.read(widget.dataProvider) as PagedDataStateInterface;
    final storiesNotifier = ref.read(widget.dataProvider.notifier);

    if (!storiesState.isLoading && !storiesState.reachedEnd) {
      (storiesNotifier as ProviderT).fetchStories();
    }

    if (storiesState.reachedEnd ||
        scrollController.position.maxScrollExtent > 0) {
      timer.cancel();
    }
  }

  void scrollListener() {
    final storiesState =
        ref.read(widget.dataProvider) as PagedDataStateInterface;
    final storiesNotifier = ref.read(widget.dataProvider.notifier) as ProviderT;

    if (!storiesState.isLoading &&
        !storiesState.reachedEnd &&
        scrollController.offset >= scrollController.position.maxScrollExtent) {
      storiesNotifier.fetchStories();
    }
  }

  @override
  Widget build(BuildContext context) {
    final stories = ref.watch(widget.dataProvider) as PagedDataStateInterface;

    return Scaffold(
      appBar: AppBar(title: const Text('Top Stories')),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () {
            initialStoryFetchesTimer = Timer.periodic(
                const Duration(milliseconds: 1000), initialStoryFetches);

            return ref.refresh(widget.refreshProvider.future);
          },
          child: ListView(
              // Show messages from bottom to top
              controller: scrollController,
              children: [
                for (Story story in stories.stories)
                  Card(
                      child: ListTile(
                    title: Text(story.title),
                    onTap: () {
                      Navigator.restorablePushNamed(
                          context, CommentsView.routeName);
                    },
                  )),
                if (stories.isLoading)
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 32),
                    child: Center(child: CircularProgressIndicator()),
                  )
              ]),
        ),
      ),
    );
  }
}
