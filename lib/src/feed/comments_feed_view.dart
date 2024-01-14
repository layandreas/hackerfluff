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

class CommentsFeedView extends ConsumerStatefulWidget {
  const CommentsFeedView({super.key});

  static const routeName = '/comments';

  @override
  ConsumerState<CommentsFeedView> createState() => _CommentsFeedViewState();
}

class _CommentsFeedViewState extends ConsumerState<CommentsFeedView> {
  bool hideReadComments = false;

  void toggleHideReadComments() {
    HapticFeedback.mediumImpact();
    setState(() {
      hideReadComments = !hideReadComments;
    });
  }

  @override
  Widget build(BuildContext context) {
    final story = Story.fromJson(
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>);
    final commentsProvider = CommentsProvider(story);
    final commentState = ref.watch(commentsProvider);
    final commentsNotifier = ref.read(commentsProvider.notifier);

    // Function to open the link
    void openStoryUrl() async {
      if (story.url != null) {
        final storyUrlParsed = Uri.parse(story.url!);

        if (await canLaunchUrl(storyUrlParsed)) {
          await launchUrl(
              storyUrlParsed); // Open the link using fwfh_url_launcher
        }
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Comments'),
        actions: [
          IconButton(
              onPressed: () {
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
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: EndlessScrollView(
            storiesState: commentState,
            dataFetcher: () => commentsNotifier.fetchStories(),
            refreshCallback: () => Future.delayed(
                const Duration(milliseconds: 100),
                () => ref.refresh(commentsProvider)),
            topOfListWidgets: [
              GestureDetector(
                onTap: () {
                  openStoryUrl();
                },
                child: StoryView(
                  story: story,
                ),
              )
            ],
            itemBuilder: (index, commentsState) {
              return Column(
                children: [
                  if (commentState.stories[index].text != null)
                    SingleCommentsView(
                      comment: commentsState.stories[index],
                      storyId: story.id,
                      isParentWidget: true,
                      hideReadComments: hideReadComments,
                    ),
                  if (commentState.stories[index].text != null) const Divider()
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
