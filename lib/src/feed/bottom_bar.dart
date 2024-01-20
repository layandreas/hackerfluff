import 'dart:ui';
import 'package:flutter/material.dart';
import '../settings/settings_view.dart';
import 'feed_view.dart';

class BottomBar extends StatelessWidget {
  final Widget child;
  const BottomBar({super.key, required this.child});

  bool routeIsSelected(BuildContext context, String routeName) {
    return ((ModalRoute.of(context)?.settings.name ?? '') == routeName)
        ? true
        : false;
  }

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
              color: Theme.of(context).colorScheme.background.withOpacity(0.85),
              child: Row(children: [
                Expanded(
                    child: IconButton(
                  isSelected: routeIsSelected(context, FeedView.routeName)
                      ? true
                      : false,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onPressed: () => {
                    if (!routeIsSelected(context, FeedView.routeName))
                      {
                        Navigator.pushReplacementNamed(
                            context, FeedView.routeName)
                      }
                  },
                  icon: const Icon(
                    Icons.home_outlined,
                    size: 30,
                  ),
                )),
                const Expanded(
                    child: Icon(
                  Icons.bookmark_outline_rounded,
                  size: 30,
                )),
                Expanded(
                    child: IconButton(
                  isSelected: routeIsSelected(context, SettingsView.routeName)
                      ? true
                      : false,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onPressed: () => {
                    if (!routeIsSelected(context, SettingsView.routeName))
                      {
                        Navigator.pushReplacementNamed(
                            context, SettingsView.routeName)
                      }
                  },
                  icon: const Icon(
                    Icons.settings_outlined,
                    size: 30,
                  ),
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
