import 'package:flutter/material.dart';
import 'comment_model.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

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
            if (comment.text != null)
              Card(
                  child: HtmlWidget(
                comment.text ?? '',
              )),
            for (final child in comment.children!)
              SingleCommentsView(comment: child)
          ],
        );
      case false:
        return Padding(
          padding: const EdgeInsets.only(left: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (comment.text != null)
                Card(child: HtmlWidget(comment.text ?? '')),
              for (final child in comment.children!)
                SingleCommentsView(comment: child)
            ],
          ),
        );
    }
  }
}
