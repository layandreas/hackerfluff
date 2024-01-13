import 'package:flutter/material.dart';

import 'src/app.dart';
import 'src/settings/settings_controller.dart';
import 'src/settings/settings_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:json_theme/json_theme.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'src/settings/settings_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Map<ThemeSetting, ThemeData> themes = {};

  for (final themePath in [
    ('assets/appainter_theme_oled_dark.json', ThemeSetting.oledDark),
    ('assets/appainter_theme_light.json', ThemeSetting.light),
    ('assets/appainter_theme_blue.json', ThemeSetting.blue)
  ]) {
    final themeStr = await rootBundle.loadString(themePath.$1);
    final themeJson = jsonDecode(themeStr);
    final theme = ThemeDecoder.decodeThemeData(themeJson)!;
    themes[themePath.$2] = theme;
  }
  // Set up the SettingsController, which will glue user settings to multiple
  // Flutter Widgets.
  final settingsController = SettingsController(SettingsService());

  // Load the user's preferred theme while the splash screen is displayed.
  // This prevents a sudden theme change when the app is first displayed.
  await settingsController.loadSettings();

  // Run the app and pass in the SettingsController. The app listens to the
  // SettingsController for changes, then passes it further down to the
  // SettingsView.
  runApp(ProviderScope(
    child:
        HackernewsApp(settingsController: settingsController, themes: themes),
  ));
}
