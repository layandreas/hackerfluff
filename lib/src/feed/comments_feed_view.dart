import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'story_model.dart';
import 'dart:async';
import 'comments_views.dart';
import 'endless_scroll_view.dart';
import 'comment_provider.dart';
import 'comment_model.dart';

class SingleCommentsView extends StatelessWidget {
  final CommentModel comment;
  final bool isParentWidget;
  const SingleCommentsView(
      {super.key, required this.comment, this.isParentWidget = false});

  @override
  Widget build(BuildContext context) {
    switch (isParentWidget) {
      case true:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (comment.text != null) Text(comment.text ?? ''),
            for (final child in comment.children!)
              TestSingleCommentsView(comment: child)
          ],
        );
      case false:
        return Padding(
          padding: const EdgeInsets.only(left: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (comment.text != null) Text(comment.text ?? ''),
              for (final child in comment.children!)
                TestSingleCommentsView(comment: child)
            ],
          ),
        );
    }
  }
}

class CommentsFeedView extends ConsumerWidget {
  const CommentsFeedView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final story = Story.fromJson(
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>);
    final commentState = ref.watch(CommentsProvider(story));
    final commentsNotifier = ref.read(CommentsProvider(story).notifier);

    return EndlessScrollView(
      storiesState: commentState,
      dataFetcher: () => commentsNotifier.fetchStories(),
      refreshCallback: () => Future.delayed(const Duration(milliseconds: 100),
          () => ref.refresh(CommentsProvider(story))),
      itemBuilder: (index, commentsState) {
        return TestSingleCommentsView(
          comment: commentsState.stories[index],
          isParentWidget: true,
        );
      },
    );
  }
}
