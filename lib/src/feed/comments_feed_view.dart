import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'story_model.dart';
import 'dart:async';
import 'comments_views.dart';
import 'endless_scroll_view.dart';
import 'comment_provider.dart';
import 'story_view.dart';

class CommentsFeedView extends ConsumerWidget {
  const CommentsFeedView({super.key});

  static const routeName = '/comments';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final story = Story.fromJson(
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>);

    final commentState = ref.watch(CommentsProvider(story));
    final commentsNotifier = ref.read(CommentsProvider(story).notifier);

    return EndlessScrollView(
      title: 'Comments',
      storiesState: commentState,
      dataFetcher: () => commentsNotifier.fetchStories(),
      refreshCallback: () => Future.delayed(const Duration(milliseconds: 100),
          () => ref.refresh(CommentsProvider(story))),
      itemBuilder: (index, commentsState) {
        return Column(
          children: [
            if (index == 0) StoryView(story: story),
            if (commentState.stories[index].text != null)
              SingleCommentsView(
                comment: commentsState.stories[index],
                isParentWidget: true,
              ),
            if (commentState.stories[index].text != null) const Divider()
          ],
        );
      },
    );
  }
}
