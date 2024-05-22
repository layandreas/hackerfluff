import 'package:freezed_annotation/freezed_annotation.dart';

// Necessary for code-generation to work
part 'settings_model.g.dart';
part 'settings_model.freezed.dart';

enum ThemeSetting { system, light, dark, darker, oledDark, blue }

enum DefaultTheme { light, dark, oledDark, darker, blue }

@freezed
class FontSettingsModel with _$FontSettingsModel {
  const factory FontSettingsModel({
    required double textScaleFactor,
  }) = _FontSettingsModel;

  factory FontSettingsModel.fromJson(Map<String, Object?> json) =>
      _$FontSettingsModelFromJson(json);
}

@freezed
class ThemeSettingsModel with _$ThemeSettingsModel {
  const factory ThemeSettingsModel({
    required ThemeSetting theme,
    required DefaultTheme defaultLightTheme,
    required DefaultTheme defaultDarkTheme,
  }) = _ThemeSettingsModel;

  factory ThemeSettingsModel.fromJson(Map<String, Object?> json) =>
      _$ThemeSettingsModelFromJson(json);
}

@freezed
class SettingsModel with _$SettingsModel {
  const factory SettingsModel(
      {required ThemeSettingsModel themeSettings,
      required FontSettingsModel fontSettings}) = _SettingsModel;

  factory SettingsModel.fromJson(Map<String, Object?> json) =>
      _$SettingsModelFromJson(json);
}

const defaultSettings = SettingsModel(
    themeSettings: ThemeSettingsModel(
        theme: ThemeSetting.system,
        defaultDarkTheme: DefaultTheme.darker,
        defaultLightTheme: DefaultTheme.light),
    fontSettings: FontSettingsModel(textScaleFactor: 1.0));
