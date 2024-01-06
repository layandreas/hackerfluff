import 'package:flutter/material.dart';
import 'comment_model.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class SingleCommentsView extends StatefulWidget {
  final CommentModel comment;
  final bool isParentWidget;
  const SingleCommentsView(
      {super.key, required this.comment, this.isParentWidget = false});

  @override
  State<SingleCommentsView> createState() => _SingleCommentsViewState();
}

class _SingleCommentsViewState extends State<SingleCommentsView> {
  bool hideChildren = false;

  @override
  Widget build(BuildContext context) {
    int commentTimeInMilliseconds = (widget.comment.time ?? 0) * 1000;
    DateTime commentTime =
        DateTime.fromMillisecondsSinceEpoch(commentTimeInMilliseconds);
    Duration timeSinceComment = DateTime.now().difference(commentTime);
    final String timeSinceCommentFmt = switch (timeSinceComment.inMinutes) {
      < 60 => '${timeSinceComment.inMinutes}m ago',
      >= 60 && < 1440 => '${timeSinceComment.inHours}h ago',
      >= 1440 => '${timeSinceComment.inDays}d ago',
      _ => ''
    };

    return Padding(
      padding: widget.isParentWidget
          ? const EdgeInsets.only(left: 0)
          : const EdgeInsets.only(left: 10.0),
      child: AnimatedSize(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 5,
            ),
            if (widget.comment.text != null)
              GestureDetector(
                child: SizedBox(
                  width: double.infinity,
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border(
                      left: BorderSide(
                          color: widget.isParentWidget
                              ? Colors.transparent
                              : Theme.of(context).colorScheme.primary,
                          width: widget.isParentWidget ? 0 : 2.0),
                    )),
                    child: Card(
                      shadowColor: Colors.transparent,
                      elevation: 0,
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          HtmlWidget(
                              '<b>${widget.comment.by ?? ''} • $timeSinceCommentFmt</b>'),
                          if (!hideChildren)
                            HtmlWidget(widget.comment.text ?? ''),
                        ],
                      ),
                    ),
                  ),
                ),
                onTap: () => setState(() {
                  hideChildren = !hideChildren;
                }),
              ),
            for (final child in hideChildren ? [] : widget.comment.children!)
              SingleCommentsView(comment: child)
          ],
        ),
      ),
    );
  }
}
