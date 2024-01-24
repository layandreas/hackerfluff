// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FontSettingsModelImpl _$$FontSettingsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$FontSettingsModelImpl(
      textScaleFactor: (json['textScaleFactor'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$FontSettingsModelImplToJson(
        _$FontSettingsModelImpl instance) =>
    <String, dynamic>{
      'textScaleFactor': instance.textScaleFactor,
    };

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
      fontSettings: json['fontSettings'] == null
          ? null
          : FontSettingsModel.fromJson(
              json['fontSettings'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SettingsModelImplToJson(_$SettingsModelImpl instance) =>
    <String, dynamic>{
      'themeSettings': instance.themeSettings?.toJson(),
      'fontSettings': instance.fontSettings?.toJson(),
    };
