import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'sample_feature/sample_item_details_view.dart';
import 'settings/settings_controller.dart';
import 'settings/settings_view.dart';
import 'feed/feed_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'settings/settings_provider.dart';
import 'settings/settings_model.dart';

/// The Widget that configures your application.
class HackernewsApp extends ConsumerWidget {
  const HackernewsApp({
    super.key,
    required this.themes,
    required this.settingsController,
  });

  final SettingsController settingsController;
  final Map<ThemeSetting, ThemeData> themes;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settingsAsyncValue = ref.watch(settingsProvider);

    final settings = switch (settingsAsyncValue) {
      AsyncData(:final value) => value,
      _ => null
    };

    var lightTheme = ThemeData(
      fontFamily: "SourceSans3",
    );
    var darkTheme = themeDark;
    var themeMode = ThemeMode.system;

    if (settings?.themeSettings != null) {
      switch (settings?.themeSettings?.theme) {
        case ThemeSetting.system:
          lightTheme = lightTheme;
          darkTheme = themeDark;
          themeMode = ThemeMode.system;
        case ThemeSetting.blue:
          darkTheme = themeBlue;
          themeMode = ThemeMode.dark;
        case ThemeSetting.light:
          lightTheme = lightTheme;
          themeMode = ThemeMode.light;
        case ThemeSetting.dark:
          darkTheme = themeDark;
          themeMode = ThemeMode.dark;
        case ThemeSetting.oledDark:
          darkTheme = themeOledDark;
          themeMode = ThemeMode.dark;
        case _:
          lightTheme = lightTheme;
          darkTheme = themeDark;
          themeMode = ThemeMode.system;
      }
    }

    // Glue the SettingsController to the MaterialApp.
    //
    // The ListenableBuilder Widget listens to the SettingsController for changes.
    // Whenever the user updates their settings, the MaterialApp is rebuilt.
    return ListenableBuilder(
      listenable: settingsController,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          // Providing a restorationScopeId allows the Navigator built by the
          // MaterialApp to restore the navigation stack when a user leaves and
          // returns to the app after it has been killed while running in the
          // background.
          restorationScopeId: 'app',

          // Provide the generated AppLocalizations to the MaterialApp. This
          // allows descendant Widgets to display the correct translations
          // depending on the user's locale.
          localizationsDelegates: const [
            AppLocalizations.delegate,
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
          onGenerateTitle: (BuildContext context) =>
              AppLocalizations.of(context)!.appTitle,

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
                //return const MyWidget();
                switch (routeSettings.name) {
                  case SettingsView.routeName:
                    return const SettingsView();
                  case SampleItemDetailsView.routeName:
                    return const SampleItemDetailsView();
                  //case SampleItemListView.routeName:
                  case FeedView.routeName:
                    return const FeedView();
                  default:
                    return const FeedView();
                }
              },
            );
          },
        );
      },
    );
  }
}

final themeOledDark = ThemeData(
    fontFamily: "SourceSans3",
    brightness: Brightness.dark,
    colorScheme: const ColorScheme(
      primary: Color(0xFFC20E5E),
      secondary: Color(0xFFC20E5E),
      background: Color(0xFF000000),
      surface: Color(0xFF000000),
      onBackground: Color(0xFFE2E2E6),
      onSurface: Color(0xFFE2E2E6),
      error: Color(0xFFFFB4AB),
      onError: Color(0xFFFF6900),
      brightness: Brightness.dark,
      onPrimary: Color(0xFF3F0019),
      onSecondary: Color(0xFF3F0019),
      onPrimaryContainer: Color(0xFF3F0019),
      onSecondaryContainer: Color(0xFF3F0019),
      onErrorContainer: Color(0xFFFFB4AB),
      onSurfaceVariant: Color(0xFFC3C7CF),
      onTertiary: Color(0xFF3B2948),
      onTertiaryContainer: Color(0xFFFFF2DA),
      surfaceVariant: Color(0xFF43474E),
      surfaceTint: Color(0xFF9ECAFF),
      scrim: Color(0xFF000000),
      outline: Color(0xFF8D9199),
      outlineVariant: Color(0xFF43474E),
      shadow: Color(0xFF000000),
      inversePrimary: Color(0xFF0061A4),
      inverseSurface: Color(0xFFE2E2E6),
      onInverseSurface: Color(0xFF2F3033),
    ));

final themeBlue = ThemeData(
    fontFamily: "SourceSans3",
    brightness: Brightness.dark,
    colorScheme: const ColorScheme(
      primary: Color(0xFF9ECAFF),
      secondary: Color(0xFFBBC7DB),
      background: Color(0xFF00131F),
      surface: Color(0xFF00131F),
      onBackground: Color(0xFFF6FAFF),
      onSurface: Color(0xFFF2FBFF),
      error: Color(0xFFFFB4AB),
      onError: Color(0xFF690005),
      brightness: Brightness.dark,
      onPrimary: Color(0xFF003258),
      onSecondary: Color(0xFF253140),
      onPrimaryContainer: Color(0xFFD1E4FF),
      onSecondaryContainer: Color(0xFFD7E3F7),
      onErrorContainer: Color(0xFFFFB4AB),
      onSurfaceVariant: Color(0xFFC3C7CF),
      onTertiary: Color(0xFF3B2948),
      onTertiaryContainer: Color(0xFFF2DAFF),
      surfaceVariant: Color(0xFF43474E),
      surfaceTint: Color(0xFF9ECAFF),
      scrim: Color(0xFF000000),
      outline: Color(0xFF8D9199),
      outlineVariant: Color(0xFF43474E),
      shadow: Color(0xFF000000),
      inversePrimary: Color(0xFF0061A4),
      inverseSurface: Color(0xFFE2E2E6),
      onInverseSurface: Color(0xFF2F3033),
    ));

final themeDark = ThemeData(
    brightness: Brightness.dark,
    fontFamily: "SourceSans3",
    colorScheme: const ColorScheme(
      primary: Color.fromARGB(255, 37, 150, 190),
      secondary: Color(0xFFC20E5E),
      background: Color.fromARGB(255, 16, 20, 24),
      surface: Color.fromARGB(255, 16, 20, 24),
      onBackground: Color(0xFFE2E2E6),
      onSurface: Color(0xFFE2E2E6),
      error: Color(0xFFFFB4AB),
      onError: Color(0xFFFF6900),
      brightness: Brightness.dark,
      onPrimary: Color(0xFF3F0019),
      onSecondary: Color(0xFF3F0019),
      onPrimaryContainer: Color(0xFF3F0019),
      onSecondaryContainer: Color(0xFF3F0019),
      onErrorContainer: Color(0xFFFFB4AB),
      onSurfaceVariant: Color(0xFFC3C7CF),
      onTertiary: Color(0xFF3B2948),
      onTertiaryContainer: Color(0xFFFFF2DA),
      surfaceVariant: Color(0xFF43474E),
      surfaceTint: Color(0xFF9ECAFF),
      scrim: Color(0xFF000000),
      outline: Color(0xFF8D9199),
      outlineVariant: Color(0xFF43474E),
      shadow: Color(0xFF000000),
      inversePrimary: Color(0xFF0061A4),
      inverseSurface: Color(0xFFE2E2E6),
      onInverseSurface: Color(0xFF2F3033),
    ));

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
