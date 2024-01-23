// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ThemeSettingsModelImpl _$$ThemeSettingsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ThemeSettingsModelImpl(
      theme: $enumDecodeNullable(_$ThemeSettingEnumMap, json['theme']),
      defaultLightTheme:
          $enumDecodeNullable(_$DefaultThemeEnumMap, json['defaultLightTheme']),
      defaultDarkTheme:
          $enumDecodeNullable(_$DefaultThemeEnumMap, json['defaultDarkTheme']),
    );

Map<String, dynamic> _$$ThemeSettingsModelImplToJson(
        _$ThemeSettingsModelImpl instance) =>
    <String, dynamic>{
      'theme': _$ThemeSettingEnumMap[instance.theme],
      'defaultLightTheme': _$DefaultThemeEnumMap[instance.defaultLightTheme],
      'defaultDarkTheme': _$DefaultThemeEnumMap[instance.defaultDarkTheme],
    };

const _$ThemeSettingEnumMap = {
  ThemeSetting.system: 'system',
  ThemeSetting.light: 'light',
  ThemeSetting.dark: 'dark',
  ThemeSetting.oledDark: 'oledDark',
  ThemeSetting.blue: 'blue',
};

const _$DefaultThemeEnumMap = {
  DefaultTheme.light: 'light',
  DefaultTheme.dark: 'dark',
  DefaultTheme.oledDark: 'oledDark',
  DefaultTheme.blue: 'blue',
};

_$SettingsModelImpl _$$SettingsModelImplFromJson(Map<String, dynamic> json) =>
    _$SettingsModelImpl(
      themeSettings: json['themeSettings'] == null
          ? null
          : ThemeSettingsModel.fromJson(
              json['themeSettings'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SettingsModelImplToJson(_$SettingsModelImpl instance) =>
    <String, dynamic>{
      'themeSettings': instance.themeSettings?.toJson(),
    };
