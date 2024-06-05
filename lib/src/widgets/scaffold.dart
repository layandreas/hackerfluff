import 'package:flutter/material.dart';

Widget customScaffold(
    {required BuildContext context,
    Widget? body,
    Widget? title,
    PreferredSizeWidget? bottom,
    List<Widget>? actions,
    double? toolbarHeight}) {
  return Scaffold(
    resizeToAvoidBottomInset: false,
    appBar: AppBar(
      scrolledUnderElevation: 0,
      leading: ModalRoute.of(context)?.canPop == true
          ? IconButton(
              icon: Icon(
                Icons.arrow_back_ios_new,
                size: 15,
                color: Theme.of(context).colorScheme.primary,
              ),
              onPressed: () => Navigator.of(context).pop(),
            )
          : null,
      toolbarHeight: toolbarHeight,
      title: title,
      bottom: bottom,
      actions: actions,
    ),
    body: body,
  );
}
