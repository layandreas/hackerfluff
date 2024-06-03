import 'package:flutter/material.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'settings/settings_view.dart';
import 'feed/feed_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'settings/settings_provider.dart';
import 'settings/settings_model.dart';
import 'themes.dart';
import 'bookmarks/bookmarks_view.dart';

/// The Widget that configures your application.
class HackernewsApp extends ConsumerWidget {
  const HackernewsApp({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settingsAsyncValue = ref.watch(settingsProvider);

    final settings = switch (settingsAsyncValue) {
      AsyncData(:final value) => value,
      _ => defaultSettings
    };

    final themes = Themes();
    var lightTheme = themes.lightTheme;

    var darkTheme = themes.themeDarker;
    var themeMode = ThemeMode.system;
    ThemeData defaultLightTheme;
    ThemeData defaultDarkTheme;

    switch (settings.themeSettings.defaultLightTheme) {
      case DefaultTheme.light:
        defaultLightTheme = themes.lightTheme;
      case DefaultTheme.dark:
        defaultLightTheme = themes.themeDark;
      case DefaultTheme.darker:
        defaultLightTheme = themes.themeDarker;
      case DefaultTheme.oledDark:
        defaultLightTheme = themes.themeOledDark;
      case DefaultTheme.blue:
        defaultLightTheme = themes.themeBlue;
    }

    switch (settings.themeSettings.defaultDarkTheme) {
      case DefaultTheme.light:
        defaultDarkTheme = themes.lightTheme;
      case DefaultTheme.dark:
        defaultDarkTheme = themes.themeDark;
      case DefaultTheme.darker:
        defaultDarkTheme = themes.themeDarker;
      case DefaultTheme.oledDark:
        defaultDarkTheme = themes.themeOledDark;
      case DefaultTheme.blue:
        defaultDarkTheme = themes.themeBlue;
    }

    switch (settings.themeSettings.theme) {
      case ThemeSetting.system:
        lightTheme = defaultLightTheme;
        darkTheme = defaultDarkTheme;
        themeMode = ThemeMode.system;
      case ThemeSetting.blue:
        darkTheme = themes.themeBlue;
        themeMode = ThemeMode.dark;
      case ThemeSetting.light:
        lightTheme = themes.lightTheme;
        themeMode = ThemeMode.light;
      case ThemeSetting.dark:
        darkTheme = themes.themeDark;
        themeMode = ThemeMode.dark;
      case ThemeSetting.darker:
        darkTheme = themes.themeDarker;
        themeMode = ThemeMode.dark;
      case ThemeSetting.oledDark:
        darkTheme = themes.themeOledDark;
        themeMode = ThemeMode.dark;
    }

    return MediaQuery(
      data: MediaQuery.of(context).copyWith(
        textScaler: TextScaler.linear(settings.fontSettings.textScaleFactor),
      ),
      child: MaterialApp(
        // Providing a restorationScopeId allows the Navigator built by the
        // MaterialApp to restore the navigation stack when a user leaves and
        // returns to the app after it has been killed while running in the
        // background.
        restorationScopeId: 'app',

        // Provide the generated AppLocalizations to the MaterialApp. This
        // allows descendant Widgets to display the correct translations
        // depending on the user's locale.
        localizationsDelegates: const [
          // AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', ''), // English, no country code
        ],

        // Use AppLocalizations to configure the correct application title
        // depending on the user's locale.
        //
        // The appTitle is defined in .arb files found in the localization
        // directory.
        // onGenerateTitle: (BuildContext context) =>
        //     AppLocalizations.of(context)!.appTitle,

        // Define a light and dark color theme. Then, read the user's
        // preferred ThemeMode (light, dark, or system default) from the
        // SettingsController to display the correct theme.
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: themeMode,

        // Define a function to handle named routes in order to support
        // Flutter web url navigation and deep linking.
        onGenerateRoute: (RouteSettings routeSettings) {
          return UnanimatedPageRoute<void>(
            settings: routeSettings,
            builder: (BuildContext context) {
              switch (routeSettings.name) {
                case SettingsView.routeName:
                  return const SettingsView();
                case FeedView.routeName:
                  return const FeedView();
                case BookmarksView.routeName:
                  return const BookmarksView();
                default:
                  return const FeedView();
              }
            },
          );
        },
      ),
    );
  }
}

class UnanimatedPageRoute<T> extends MaterialPageRoute<T> {
  UnanimatedPageRoute({
    required super.builder,
    super.settings,
    super.maintainState,
    super.fullscreenDialog,
  });

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return child;
  }
}
