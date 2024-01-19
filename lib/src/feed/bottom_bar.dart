import 'dart:ui';
import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  final Widget child;
  const BottomBar({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        child,
        ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
              padding: const EdgeInsets.only(bottom: 10),
              alignment: Alignment.center,
              width: double.infinity,
              height: 65,
              color: Theme.of(context).colorScheme.background.withOpacity(0.9),
              child: const Row(children: [
                Expanded(
                    child: Icon(
                  Icons.home_outlined,
                  size: 30,
                )),
                Expanded(
                    child: Icon(
                  Icons.bookmark_outline_rounded,
                  size: 30,
                )),
                Expanded(
                    child: Icon(
                  Icons.settings_outlined,
                  size: 30,
                ))
              ]),

              //Colors.black.withOpacity(0.8),
            ),
          ),
        )
      ],
    );
  }
}
