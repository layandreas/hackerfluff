import 'package:flutter/material.dart';
import 'comment_model.dart';

const comment = CommentModel(id: 1, text: 'comment1', children: [
  CommentModel(id: 2, text: 'comment2', children: [
    CommentModel(id: 4, text: 'comment4', children: []),
    CommentModel(id: 5, text: 'comment5', children: [])
  ]),
  CommentModel(id: 3, text: 'comment3', children: [])
]);

class CommentsView extends StatelessWidget {
  const CommentsView({super.key});

  static const routeName = '/placeholder';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Comments')),
        body: const Center(
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
              Text(comment.text),
              for (final child in comment.children!)
                TestSingleCommentsView(comment: child)
            ],
          ),
        );
    }
  }
}
