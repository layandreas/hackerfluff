import 'package:flutter/material.dart';
import 'dart:async';
import 'paged_data_state_interface.dart';
import 'package:flutter/services.dart';

class EndlessScrollView extends StatefulWidget {
  const EndlessScrollView({
    super.key,
    required this.storiesState,
    required this.dataFetcher,
    required this.refreshCallback,
    required this.itemBuilder,
    this.topOfListWidgets = const [],
    this.cacheExtent,
  });

  final PagedDataStateInterface storiesState;
  final void Function() dataFetcher;
  final Future Function() refreshCallback;
  final Widget Function(int index, PagedDataStateInterface pagedStoriesState)
      itemBuilder;
  final List<Widget> topOfListWidgets;
  final double? cacheExtent;

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
    final numberOfComments = widget.storiesState.stories.length;
    final numberOfTopListWidgets = widget.topOfListWidgets.length;

    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: RefreshIndicator(
          onRefresh: () {
            HapticFeedback.mediumImpact();

            initialStoryFetchesTimer =
                Timer.periodic(initialStoryFetchesPeriod, initialStoryFetches);

            return widget.refreshCallback();
          },
          child: Scrollbar(
            controller: scrollController,
            child: ListView.builder(
              cacheExtent: widget.cacheExtent,
              physics: const AlwaysScrollableScrollPhysics(),
              controller: scrollController,
              itemCount: numberOfComments + numberOfTopListWidgets + 1,
              itemBuilder: (context, index) {
                return EndlessScrollItem(
                    key: ValueKey(index),
                    index: index,
                    storiesState: widget.storiesState,
                    itemBuilder: widget.itemBuilder,
                    topOfListWidgets: widget.topOfListWidgets);
              },
            ),
          ),
        ),
      ),
    );
  }
}

class EndlessScrollItem extends StatelessWidget {
  const EndlessScrollItem({
    super.key,
    required this.index,
    required this.storiesState,
    required this.itemBuilder,
    this.topOfListWidgets = const [],
  });

  final int index;
  final PagedDataStateInterface storiesState;
  final Widget Function(int index, PagedDataStateInterface pagedStoriesState)
      itemBuilder;
  final List<Widget> topOfListWidgets;

  @override
  Widget build(BuildContext context) {
    final numberOfComments = storiesState.stories.length;
    final numberOfTopListWidgets = topOfListWidgets.length;

    if (index < numberOfTopListWidgets) {
      return topOfListWidgets[index];
    } else if (index >= numberOfTopListWidgets &&
        index <= numberOfComments + numberOfTopListWidgets - 1) {
      return itemBuilder(index - numberOfTopListWidgets, storiesState);
    } else {
      if (storiesState.isLoading) {
        return const Padding(
          padding: EdgeInsets.symmetric(vertical: 32),
          child: Center(child: CircularProgressIndicator()),
        );
      }

      if (storiesState.reachedEnd) {
        return const ListTile(title: Text("You reached the end..."));
      }

      return const ListTile(title: Text(""));
    }
  }
}
