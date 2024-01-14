import 'package:freezed_annotation/freezed_annotation.dart';

// Necessary for code-generation to work
part 'settings_model.g.dart';
part 'settings_model.freezed.dart';

enum ThemeSetting { system, light, dark, oledDark, blue }

@freezed
class ThemeSettingsModel with _$ThemeSettingsModel {
  const factory ThemeSettingsModel({
    ThemeSetting? theme,
  }) = _ThemeSettingsModel;

  factory ThemeSettingsModel.fromJson(Map<String, Object?> json) =>
      _$ThemeSettingsModelFromJson(json);
}

@freezed
class SettingsModel with _$SettingsModel {
  const factory SettingsModel({ThemeSettingsModel? themeSettings}) =
      _SettingsModel;

  factory SettingsModel.fromJson(Map<String, Object?> json) =>
      _$SettingsModelFromJson(json);
}
