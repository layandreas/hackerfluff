import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'comment_model.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'comment_status_provider.dart';
import 'package:flutter/services.dart';

class SingleCommentsView extends StatefulWidget {
  final CommentModelFlat comment;
  final int storyId;
  final bool hideReadComments;
  final Function(bool) setHiddenComments;

  const SingleCommentsView(
      {super.key,
      required this.comment,
      required this.storyId,
      required this.hideReadComments,
      required this.setHiddenComments});

  @override
  State<SingleCommentsView> createState() => _SingleCommentsViewState();
}

class _SingleCommentsViewState extends State<SingleCommentsView> {
  bool hideCard = false;

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
    final commentCompositeId =
        '${widget.comment.id}-${widget.comment.by}-${widget.comment.time}';

    return Padding(
      padding:
          EdgeInsets.only(left: (widget.comment.nParents?.toDouble() ?? 0) * 7),
      child: AnimatedSize(
        alignment: Alignment.topLeft,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
        child: GestureDetector(
          child: SizedBox(
            width: double.infinity,
            child: Container(
              decoration: BoxDecoration(
                  border: Border(
                left: BorderSide(
                    color: (widget.comment.parentId == null)
                        ? Colors.transparent
                        : Theme.of(context).colorScheme.primary,
                    width: (widget.comment.parentId == null) ? 0 : 2.0),
              )),
              child: CommentCard(
                key: Key(commentCompositeId),
                id: widget.comment.id,
                storyId: widget.storyId,
                widget: widget,
                timeSinceCommentFmt: timeSinceCommentFmt,
                hideCard: hideCard,
                hideReadComments: widget.hideReadComments,
              ),
            ),
          ),
          onTap: () {
            HapticFeedback.mediumImpact();
            setState(() {
              hideCard = !hideCard;
              widget.setHiddenComments(hideCard);
            });
          },
        ),
      ),
    );
  }
}

class CommentCard extends ConsumerStatefulWidget {
  const CommentCard({
    required super.key,
    required this.widget,
    required this.timeSinceCommentFmt,
    required this.hideCard,
    required this.id,
    required this.storyId,
    this.hideReadComments = false,
  });

  final SingleCommentsView widget;
  final String timeSinceCommentFmt;
  final bool hideCard;
  final int id;
  final int storyId;
  final bool hideReadComments;

  @override
  ConsumerState<CommentCard> createState() => _CommentCardState();
}

class _CommentCardState extends ConsumerState<CommentCard> {
  @override
  Widget build(BuildContext context) {
    final commentStatusAsyncValue = ref.watch(commentStatusProvider(widget.id));
    final commentStatusNotifier =
        ref.read(commentStatusProvider(widget.id).notifier);
    final commentStatus = commentStatusAsyncValue.valueOrNull;
    final bool commentWasSeen;
    if (commentStatus != null) {
      commentWasSeen = (commentStatus.commentWasSeen == 1) ? true : false;
    } else {
      commentWasSeen = false;
    }
    // final commentWasSeen =
    //     ((commentStatus?.commentWasSeen) ?? 0) == 0 ? false : true;

    return VisibilityDetector(
        key: Key('comment-visibility-${widget.key}'),
        onVisibilityChanged: (visibilityInfo) {
          if (!commentWasSeen) {
            commentStatusNotifier.insertCommentStatus(
                id: widget.id, storyId: widget.storyId, commentWasSeen: 1);
          }
        },
        child: Card(
          shadowColor: Colors.transparent,
          elevation: 0,
          color: Colors.transparent,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  HtmlWidget(
                      '<b>${widget.widget.comment.by ?? ''} • ${widget.timeSinceCommentFmt}</b>'),
                  Icon(
                    Icons.check,
                    color: commentWasSeen
                        ? Theme.of(context).colorScheme.primary
                        : Colors.grey,
                  )
                ],
              ),
              if (!widget.hideCard)
                if ((widget.hideReadComments && !commentWasSeen) ||
                    !widget.hideReadComments)
                  HtmlWidget(widget.widget.comment.text ?? ''),
            ],
          ),
        ));
  }
}
