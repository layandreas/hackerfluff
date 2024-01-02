import 'package:flutter/material.dart';
import 'comment_model.dart';

final comment = CommentModel(1, 'comment1', [
  CommentModel(2, 'comment2', <CommentModel>[
    CommentModel(4, 'comment4', <CommentModel>[]),
    CommentModel(5, 'comment5', <CommentModel>[])
  ]),
  CommentModel(3, 'comment3', <CommentModel>[])
]);

class CommentsView extends StatelessWidget {
  const CommentsView({super.key});

  static const routeName = '/placeholder';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Comments')),
        body: Center(
          child: TestSingleCommentsView(
            comment: comment,
            isParentWidget: true,
          ),
        ));
  }
}

class TestSingleCommentsView extends StatelessWidget {
  final CommentModel comment;
  final bool isParentWidget;
  const TestSingleCommentsView(
      {super.key, required this.comment, this.isParentWidget = false});

  @override
  Widget build(BuildContext context) {
    switch (isParentWidget) {
      case true:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(comment.text),
            for (final child in comment.children)
              TestSingleCommentsView(comment: child)
          ],
        );
      case false:
        return Padding(
          padding: const EdgeInsets.only(left: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(comment.text),
              for (final child in comment.children)
                TestSingleCommentsView(comment: child)
            ],
          ),
        );
    }
  }
}
