import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'story_model.dart';
import 'dart:async';
import 'comments_views.dart';
import 'endless_scroll_view.dart';
import 'comment_provider.dart';
import 'story_view.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';
import 'top_stories_provider.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class CommentsFeedView extends ConsumerStatefulWidget {
  const CommentsFeedView({super.key, required this.story});

  static const routeName = '/comments';
  final Story story;

  @override
  ConsumerState<CommentsFeedView> createState() => _CommentsFeedViewState();
}

class _CommentsFeedViewState extends ConsumerState<CommentsFeedView> {
  bool hideReadComments = false;
  Set<int> hiddenComments = {};

  void toggleHideReadComments() {
    HapticFeedback.mediumImpact();
    setState(() {
      hideReadComments = !hideReadComments;
    });
  }

  @override
  Widget build(BuildContext context) {
    final commentsProvider = CommentsProvider(widget.story);
    final commentState = ref.watch(commentsProvider);
    final commentsNotifier = ref.read(commentsProvider.notifier);
    final bookmarkedStories =
        ref.watch(topStoriesProvider(StoryListEndpoint.bookmarks)).value;
    final bookmarkedStoriesNotifier =
        ref.watch(topStoriesProvider(StoryListEndpoint.bookmarks).notifier);

    void onAddBookmark({required int storyId, required String title}) {
      bookmarkedStoriesNotifier.addBookmarkedStory(
          storyId: storyId, title: title);
    }

    void onRemoveBookmark({required int storyId}) {
      bookmarkedStoriesNotifier.removeBookmarkedStory(storyId: storyId);
    }

    // Function to open the link
    void openStoryUrl() async {
      if (widget.story.url != null) {
        final storyUrlParsed = Uri.parse(widget.story.url!);

        if (await canLaunchUrl(storyUrlParsed)) {
          await launchUrl(
              storyUrlParsed); // Open the link using fwfh_url_launcher
        }
      }
    }

    return Scaffold(
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
        title: Text(
          'Comments',
          style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  hiddenComments = {};
                });

                HapticFeedback.mediumImpact();
                ref.invalidate(commentsProvider);
                commentsNotifier.fetchStories();
              },
              icon: const Icon(Icons.refresh_rounded)),
          IconButton(
              onPressed: toggleHideReadComments,
              icon: Icon(
                hideReadComments
                    ? Icons.comments_disabled_rounded
                    : Icons.comments_disabled_rounded,
                color: hideReadComments
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).disabledColor,
              ))
        ],
      ),
      body: EndlessScrollView(
        key: ValueKey(widget.story.id),
        cacheExtent: 6000,
        storiesState: commentState,
        dataFetcher: () => commentsNotifier.fetchStories(),
        refreshCallback: () {
          setState(() {
            hiddenComments = {};
          });
          return Future.delayed(const Duration(milliseconds: 100),
              () => ref.refresh(commentsProvider));
        },
        topOfListWidgets: [
          GestureDetector(
            onTap: () {
              openStoryUrl();
            },
            child: StoryView(
              onRemoveBookmark: onRemoveBookmark,
              onAddBookmark: onAddBookmark,
              story: widget.story,
              isBookmarked:
                  bookmarkedStories?.storyIds.contains(widget.story.id) ??
                      false,
            ),
          ),
          if (widget.story.text != null) HtmlWidget(widget.story.text ?? ''),
          if (widget.story.text != null) const Divider()
        ],
        itemBuilder: (index, commentsState) {
          if (commentsState.stories[index].text != null &&
              !hiddenComments.contains(index)) {
            return SingleCommentsView(
                key: ValueKey(index),
                comment: commentsState.stories[index],
                storyId: widget.story.id,
                hideReadComments: hideReadComments,
                setHiddenComments: (bool isHidden) => {
                      setState(() {
                        final nChildren =
                            commentsState.stories[index]?.nChildren ?? 0;
                        final hiddenChildrenIndeces = List.generate(
                            nChildren, (listIndex) => listIndex + index + 1);
                        isHidden
                            ? hiddenComments.addAll(hiddenChildrenIndeces)
                            : hiddenComments.removeAll(hiddenChildrenIndeces);
                      })
                    });
          } else {
            return Container(
              height: 0,
            );
          }
        },
      ),
    );
  }
}
