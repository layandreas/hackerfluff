import 'package:flutter/material.dart';
import 'story_model.dart';
import 'dart:async';
import 'comments_views.dart';
import 'stories_provider.dart';
import 'page_stories_state_model.dart';

class EndlessScrollView extends StatefulWidget {
  const EndlessScrollView(
      {super.key,
      required this.storiesState,
      required this.dataFetcher,
      required this.refreshCallback});

  final PagedStoriesState storiesState;
  final Function() dataFetcher;
  final Future Function() refreshCallback;

  @override
  State<EndlessScrollView> createState() => _EndlessScrollViewState();
}

class _EndlessScrollViewState<ProviderT extends FetchingNotifier>
    extends State<EndlessScrollView> {
  final scrollController = ScrollController();
  Timer? initialStoryFetchesTimer;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(scrollListener);

    widget.dataFetcher();
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
    if (!widget.storiesState.isLoading && !widget.storiesState.reachedEnd) {
      widget.dataFetcher();
    }

    if (widget.storiesState.reachedEnd ||
        scrollController.position.maxScrollExtent > 0) {
      timer.cancel();
    }
  }

  void scrollListener() {
    if (!widget.storiesState.isLoading &&
        !widget.storiesState.reachedEnd &&
        scrollController.offset >= scrollController.position.maxScrollExtent) {
      widget.dataFetcher();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Top Stories')),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () {
            initialStoryFetchesTimer = Timer.periodic(
                const Duration(milliseconds: 1000), initialStoryFetches);

            return widget.refreshCallback();
          },
          child: ListView(
              // Show messages from bottom to top
              controller: scrollController,
              children: [
                for (Story story in widget.storiesState.stories)
                  Card(
                      child: ListTile(
                    title: Text(story.title),
                    onTap: () {
                      Navigator.restorablePushNamed(
                          context, CommentsView.routeName);
                    },
                  )),
                if (widget.storiesState.isLoading)
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
