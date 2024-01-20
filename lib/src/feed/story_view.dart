import 'package:flutter/material.dart';
import 'story_model.dart';
import 'dart:math';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'n_comments_seen_provider.dart';

class StoryView extends ConsumerWidget {
  const StoryView({super.key, required this.story});

  final Story story;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nCommentsSeenAsync = ref.watch(nCommentsSeenProvider(story.id));
    final nCommentsSeen = switch (nCommentsSeenAsync) {
      AsyncData(:final value) => min(value, story.descendants ?? 0),
      _ => 0,
    };

    int storyTimeInMilliseconds = (story.time ?? 0) * 1000;
    DateTime storyTime = DateTime.fromMillisecondsSinceEpoch(
        storyTimeInMilliseconds,
        isUtc: true);
    Duration timeSinceStory = DateTime.now().toUtc().difference(storyTime);
    final String timeSinceStoryFmt = switch (timeSinceStory.inMinutes) {
      < 60 => '${timeSinceStory.inMinutes}m ago',
      >= 60 && < 1440 => '${timeSinceStory.inHours}h ago',
      >= 1440 => '${timeSinceStory.inDays}d ago',
      _ => ''
    };

    final descendants = story.descendants ?? 0;
    final String numberOfCommentsFormatted = switch (descendants) {
      == 0 => '$descendants comments',
      == 1 => '$descendants comment',
      > 1 => '$descendants comments',
      _ => '$descendants comment',
    };

    Uri? urlParsed;
    final String urlFormatted;

    if (story.url != null) {
      urlParsed = Uri.parse(story.url!);
      urlFormatted = urlParsed.host.replaceAll('www.', '');
    } else {
      urlFormatted = '';
    }

    return Card(
      elevation: 0,
      color: Colors.transparent,
      shadowColor: Colors.transparent,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        RichText(
            text: TextSpan(
          text: story.title,
          style: DefaultTextStyle.of(context).style.copyWith(
              fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
              fontWeight: FontWeight.bold),
        )),
        RichText(
            text: TextSpan(
                text: urlFormatted, style: DefaultTextStyle.of(context).style)),
        RichText(
            text: TextSpan(
                text: '${story.by} • $timeSinceStoryFmt',
                style: DefaultTextStyle.of(context).style)),
        RichText(
            text: TextSpan(
                text:
                    '${story.score.toString()} points • $numberOfCommentsFormatted ',
                children: [
                  TextSpan(
                      text: '($nCommentsSeen read)',
                      style: DefaultTextStyle.of(context).style.copyWith(
                          color: Theme.of(context).colorScheme.primary))
                ],
                style: DefaultTextStyle.of(context).style)),
        const Divider()
      ]),
    );
  }
}
