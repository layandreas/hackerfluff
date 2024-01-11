import 'package:flutter/material.dart';
import 'story_model.dart';

class StoryView extends StatelessWidget {
  const StoryView({super.key, required this.story});

  final Story story;

  @override
  Widget build(BuildContext context) {
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

    return SizedBox(
      width: double.infinity,
      child: Card(
        elevation: 0,
        color: Colors.transparent,
        shadowColor: Colors.transparent,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          RichText(
              text: TextSpan(
                  text: story.title,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onBackground,
                      fontWeight: FontWeight.bold,
                      fontSize:
                          Theme.of(context).textTheme.titleMedium?.fontSize))),
          RichText(
              text: TextSpan(
                  text: urlFormatted,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onBackground))),
          RichText(
              text: TextSpan(
                  text: '${story.by} • $timeSinceStoryFmt',
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onBackground))),
          RichText(
              text: TextSpan(
                  text:
                      '${story.score.toString()} points • $numberOfCommentsFormatted',
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onBackground))),
          const Divider()
        ]),
      ),
    );
  }
}
