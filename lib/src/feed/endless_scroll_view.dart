import 'package:flutter/material.dart';
import 'dart:async';
import 'paged_data_state_interface.dart';

class EndlessScrollView extends StatefulWidget {
  const EndlessScrollView({
    super.key,
    required this.storiesState,
    required this.dataFetcher,
    required this.refreshCallback,
    required this.itemBuilder,
  });

  final PagedDataStateInterface storiesState;
  final void Function() dataFetcher;
  final Future Function() refreshCallback;
  final Widget Function(int index, PagedDataStateInterface pagedStoriesState)
      itemBuilder;

  @override
  State<EndlessScrollView> createState() => _EndlessScrollViewState();
}

class _EndlessScrollViewState extends State<EndlessScrollView> {
  final scrollController = ScrollController();
  Timer? initialStoryFetchesTimer;
  final Duration initialStoryFetchesPeriod = const Duration(milliseconds: 500);

  @override
  void initState() {
    super.initState();
    scrollController.addListener(scrollListener);

    Future(widget.dataFetcher);
    initialStoryFetchesTimer =
        Timer.periodic(initialStoryFetchesPeriod, initialStoryFetches);
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
    initialStoryFetchesTimer?.cancel();
  }

  void initialStoryFetches(Timer timer) {
    if (!widget.storiesState.isLoading && !widget.storiesState.reachedEnd) {
      Future(widget.dataFetcher);
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
      Future(widget.dataFetcher);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: RefreshIndicator(
        onRefresh: () {
          initialStoryFetchesTimer =
              Timer.periodic(initialStoryFetchesPeriod, initialStoryFetches);

          return widget.refreshCallback();
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: ListView.builder(
            // Show messages from bottom to top
            physics: const AlwaysScrollableScrollPhysics(),
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
