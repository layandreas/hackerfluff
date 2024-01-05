import 'package:flutter/material.dart';
import 'dart:async';
import 'stories_provider.dart';
import 'page_stories_state_model.dart';

class EndlessScrollView extends StatefulWidget {
  const EndlessScrollView(
      {super.key,
      required this.storiesState,
      required this.dataFetcher,
      required this.refreshCallback,
      required this.itemBuilder});

  final PagedStoriesState storiesState;
  final Function() dataFetcher;
  final Future Function() refreshCallback;
  final Widget Function(int index, PagedStoriesState pagedStoriesState)
      itemBuilder;

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
                const Duration(milliseconds: 500), initialStoryFetches);

            return widget.refreshCallback();
          },
          child: ListView.builder(
            // Show messages from bottom to top
            controller: scrollController,
            itemCount: widget.storiesState.stories.length + 1,
            itemBuilder: (context, index) {
              if (index <= widget.storiesState.stories.length - 1) {
                return widget.itemBuilder(index, widget.storiesState);
              } else {
                if (widget.storiesState.isLoading) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 32),
                    child: Center(child: CircularProgressIndicator()),
                  );
                }

                if (widget.storiesState.reachedEnd) {
                  return const ListTile(title: Text("You reached the end..."));
                }

                return const ListTile(title: Text(""));
              }
            },
          ),
        ),
      ),
    );
  }
}
