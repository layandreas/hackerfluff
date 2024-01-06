import 'package:flutter/material.dart';
import 'story_model.dart';

class StoryView extends StatelessWidget {
  const StoryView({super.key, required this.story});

  final Story story;

  @override
  Widget build(BuildContext context) {
    int storyTimeInMilliseconds = (story.time ?? 0) * 1000;
    DateTime storyTime =
        DateTime.fromMillisecondsSinceEpoch(storyTimeInMilliseconds);
    Duration timeSinceStory = DateTime.now().difference(storyTime);
    final String timeSinceStoryFmt = switch (timeSinceStory.inMinutes) {
      < 60 => '${timeSinceStory.inMinutes}m ago',
      >= 60 && < 1440 => '${timeSinceStory.inHours}h ago',
      >= 1440 => '${timeSinceStory.inHours}d ago',
      _ => ''
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
                      fontWeight: FontWeight.bold,
                      fontSize: Theme.of(context)
                          .textTheme
                          .headlineMedium
                          ?.fontSize))),
          RichText(text: TextSpan(text: urlFormatted)),
          RichText(text: TextSpan(text: '${story.by} • $timeSinceStoryFmt')),
          RichText(text: TextSpan(text: '${story.score.toString()} points')),
          const Divider()
        ]),
      ),
    );
  }
}
