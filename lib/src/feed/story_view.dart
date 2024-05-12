import 'package:flutter/material.dart';
import 'story_model.dart';
import 'dart:math';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'n_comments_seen_provider.dart';
import 'package:flutter/services.dart';

class StoryView extends ConsumerWidget {
  const StoryView(
      {super.key,
      required this.story,
      required this.isBookmarked,
      required this.onAddBookmark,
      required this.onRemoveBookmark,
      this.isCollapsedToHeightZero = false});

  final Story story;
  final bool isBookmarked;
  final void Function({required int storyId, required String title})
      onAddBookmark;
  final void Function({required int storyId}) onRemoveBookmark;
  final bool isCollapsedToHeightZero;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nCommentsSeenAsync = ref.watch(nCommentsSeenProvider(story.id));
    final nCommentsSeen = switch (nCommentsSeenAsync) {
      AsyncData(:final value) => min(value, story.descendants ?? 0),
      _ => 0,
    };
    final double? storyViewHeight = isCollapsedToHeightZero ? 0 : null;

    int storyTimeInMilliseconds = (story.time ?? 0) * 1000;
    DateTime storyTime = DateTime.fromMillisecondsSinceEpoch(
        storyTimeInMilliseconds,
        isUtc: true);
    Duration timeSinceStory = DateTime.now().toUtc().difference(storyTime);
    final String timeSinceStoryFmt = switch (timeSinceStory.inMinutes) {
      < 60 => '${timeSinceStory.inMinutes}m',
      >= 60 && < 1440 => '${timeSinceStory.inHours}h',
      >= 1440 => '${timeSinceStory.inDays}d',
      _ => ''
    };

    final descendants = story.descendants ?? 0;
    final String numberOfCommentsFormatted = switch (descendants) {
      == 0 => '$descendants',
      == 1 => '$descendants',
      > 1 => '$descendants',
      _ => '$descendants',
    };

    Uri? urlParsed;
    final String urlFormatted;

    if (story.url != null) {
      urlParsed = Uri.parse(story.url!);
      urlFormatted = urlParsed.host.replaceAll('www.', '');
    } else {
      urlFormatted = '';
    }

    final defaultTextStyle = DefaultTextStyle.of(context);
    final mediaQuery = MediaQuery.of(context);

    final textScaler = mediaQuery.textScaler;
    final textScalerDefaultTextStyle =
        textScaler.scale(defaultTextStyle.style.fontSize!);
    final textScalerTitleMedium =
        textScaler.scale(Theme.of(context).textTheme.titleMedium!.fontSize!);
    final textScalerIcon = textScaler.scale(18);
    final theme = Theme.of(context);

    return AnimatedSize(
      alignment: Alignment.topLeft,
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInOut,
      child: SizedBox(
        height: storyViewHeight,
        child: Stack(
          children: [
            Card(
              margin: const EdgeInsets.only(top: 0),
              elevation: 0,
              color: Colors.transparent,
              shadowColor: Colors.transparent,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                        text: TextSpan(
                      text: story.title,
                      style: defaultTextStyle.style.copyWith(
                          fontSize: textScalerTitleMedium,
                          fontWeight: FontWeight.bold),
                    )),
                    if (story.url != null)
                      RichText(
                          text: TextSpan(
                              text: urlFormatted,
                              style: defaultTextStyle.style.copyWith(
                                  fontSize: textScalerDefaultTextStyle))),
                    RichText(
                        text: TextSpan(
                            children: [
                          WidgetSpan(
                              child: Icon(Icons.person_2_outlined,
                                  size: textScalerIcon)),
                          TextSpan(
                            text: ' ${story.by} • ',
                          ),
                          WidgetSpan(
                              child: Icon(Icons.schedule_outlined,
                                  size: textScalerIcon)),
                          TextSpan(
                            text: ' $timeSinceStoryFmt',
                          )
                        ],
                            style: defaultTextStyle.style.copyWith(
                                fontSize: textScalerDefaultTextStyle))),
                    RichText(
                        text: TextSpan(
                            children: [
                          WidgetSpan(
                              child: Icon(Icons.thumb_up_outlined,
                                  size: textScalerIcon)),
                          TextSpan(text: ' ${story.score.toString()} • '),
                          WidgetSpan(
                              child: Icon(Icons.mode_comment_outlined,
                                  size: textScalerIcon)),
                          TextSpan(text: ' $numberOfCommentsFormatted '),
                          TextSpan(
                              children: [
                                const TextSpan(text: '('),
                                WidgetSpan(
                                    child: Icon(
                                  Icons.check,
                                  size: textScalerIcon,
                                  color: theme.colorScheme.primary,
                                )),
                                TextSpan(text: '$nCommentsSeen'),
                                const TextSpan(text: ')'),
                              ],
                              style: defaultTextStyle.style.copyWith(
                                  color: theme.colorScheme.primary,
                                  fontSize: textScalerDefaultTextStyle))
                        ],
                            style: defaultTextStyle.style.copyWith(
                                fontSize: textScalerDefaultTextStyle))),
                    const Divider()
                  ]),
            ),
            Positioned.fill(
              bottom: 7,
              child: Align(
                  alignment: Alignment.bottomRight,
                  child: isBookmarked
                      ? IconButton(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          iconSize: isCollapsedToHeightZero ? 0 : null,
                          onPressed: () {
                            HapticFeedback.mediumImpact();

                            onRemoveBookmark(storyId: story.id);
                          },
                          icon: Icon(
                            Icons.bookmark,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        )
                      : IconButton(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          iconSize: isCollapsedToHeightZero ? 0 : null,
                          onPressed: () {
                            HapticFeedback.mediumImpact();

                            onAddBookmark(
                                storyId: story.id, title: story.title);
                          },
                          icon: const Icon(
                            Icons.bookmark_outline,
                          ),
                        )),
            )
          ],
        ),
      ),
    );
  }
}
