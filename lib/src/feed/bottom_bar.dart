import 'dart:ui';
import 'package:flutter/material.dart';
import '../settings/settings_view.dart';
import 'feed_view.dart';
import '../bookmarks/bookmarks_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'top_stories_provider.dart';

class BottomBar extends ConsumerWidget {
  final Widget child;
  const BottomBar({super.key, required this.child});

  bool routeIsSelected(BuildContext context, String routeName) {
    return ((ModalRoute.of(context)?.settings.name ?? '') == routeName)
        ? true
        : false;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        child,
        ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              decoration: BoxDecoration(
                  color:
                      Theme.of(context).colorScheme.surface.withOpacity(0.70),
                  border: Border(
                      top: BorderSide(
                          color: Theme.of(context)
                              .colorScheme
                              .inverseSurface
                              .withAlpha(75)))),
              padding: const EdgeInsets.only(bottom: 25),
              alignment: Alignment.center,
              width: double.infinity,
              height: 75,
              //color: Theme.of(context).colorScheme.background.withOpacity(0.85),
              child: Row(children: [
                Expanded(
                    child: IconButton(
                  isSelected: (routeIsSelected(context, FeedView.routeName) ||
                          routeIsSelected(context, '/'))
                      ? true
                      : false,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onPressed: () {
                    if (!routeIsSelected(context, FeedView.routeName)) {
                      // We need this to make sure the bookmarkspage is always
                      // up-to-date as the page doesn't invalidate the bookmarks
                      // provider
                      ref.invalidate(
                          topStoriesProvider(StoryListEndpoint.bookmarks));

                      Navigator.pushReplacementNamed(
                          context, FeedView.routeName);
                    }
                  },
                  icon: const Icon(
                    Icons.home_outlined,
                    size: 30,
                  ),
                )),
                Expanded(
                    child: IconButton(
                  isSelected: routeIsSelected(context, BookmarksView.routeName)
                      ? true
                      : false,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onPressed: () {
                    if (!routeIsSelected(context, BookmarksView.routeName)) {
                      // We need this to make sure the bookmarkspage is always
                      // up-to-date as the page doesn't invalidate the bookmarks
                      // provider
                      ref.invalidate(
                          topStoriesProvider(StoryListEndpoint.bookmarks));
                      Navigator.pushReplacementNamed(
                          context, BookmarksView.routeName);
                    }
                  },
                  icon: const Icon(Icons.bookmark_outline_rounded, size: 30),
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
