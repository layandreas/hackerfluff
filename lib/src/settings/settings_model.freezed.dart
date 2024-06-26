// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FontSettingsModel _$FontSettingsModelFromJson(Map<String, dynamic> json) {
  return _FontSettingsModel.fromJson(json);
}

/// @nodoc
mixin _$FontSettingsModel {
  double get textScaleFactor => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FontSettingsModelCopyWith<FontSettingsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FontSettingsModelCopyWith<$Res> {
  factory $FontSettingsModelCopyWith(
          FontSettingsModel value, $Res Function(FontSettingsModel) then) =
      _$FontSettingsModelCopyWithImpl<$Res, FontSettingsModel>;
  @useResult
  $Res call({double textScaleFactor});
}

/// @nodoc
class _$FontSettingsModelCopyWithImpl<$Res, $Val extends FontSettingsModel>
    implements $FontSettingsModelCopyWith<$Res> {
  _$FontSettingsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? textScaleFactor = null,
  }) {
    return _then(_value.copyWith(
      textScaleFactor: null == textScaleFactor
          ? _value.textScaleFactor
          : textScaleFactor // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FontSettingsModelImplCopyWith<$Res>
    implements $FontSettingsModelCopyWith<$Res> {
  factory _$$FontSettingsModelImplCopyWith(_$FontSettingsModelImpl value,
          $Res Function(_$FontSettingsModelImpl) then) =
      __$$FontSettingsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double textScaleFactor});
}

/// @nodoc
class __$$FontSettingsModelImplCopyWithImpl<$Res>
    extends _$FontSettingsModelCopyWithImpl<$Res, _$FontSettingsModelImpl>
    implements _$$FontSettingsModelImplCopyWith<$Res> {
  __$$FontSettingsModelImplCopyWithImpl(_$FontSettingsModelImpl _value,
      $Res Function(_$FontSettingsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? textScaleFactor = null,
  }) {
    return _then(_$FontSettingsModelImpl(
      textScaleFactor: null == textScaleFactor
          ? _value.textScaleFactor
          : textScaleFactor // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FontSettingsModelImpl implements _FontSettingsModel {
  const _$FontSettingsModelImpl({required this.textScaleFactor});

  factory _$FontSettingsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FontSettingsModelImplFromJson(json);

  @override
  final double textScaleFactor;

  @override
  String toString() {
    return 'FontSettingsModel(textScaleFactor: $textScaleFactor)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FontSettingsModelImpl &&
            (identical(other.textScaleFactor, textScaleFactor) ||
                other.textScaleFactor == textScaleFactor));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, textScaleFactor);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FontSettingsModelImplCopyWith<_$FontSettingsModelImpl> get copyWith =>
      __$$FontSettingsModelImplCopyWithImpl<_$FontSettingsModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FontSettingsModelImplToJson(
      this,
    );
  }
}

abstract class _FontSettingsModel implements FontSettingsModel {
  const factory _FontSettingsModel({required final double textScaleFactor}) =
      _$FontSettingsModelImpl;

  factory _FontSettingsModel.fromJson(Map<String, dynamic> json) =
      _$FontSettingsModelImpl.fromJson;

  @override
  double get textScaleFactor;
  @override
  @JsonKey(ignore: true)
  _$$FontSettingsModelImplCopyWith<_$FontSettingsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ThemeSettingsModel _$ThemeSettingsModelFromJson(Map<String, dynamic> json) {
  return _ThemeSettingsModel.fromJson(json);
}

/// @nodoc
mixin _$ThemeSettingsModel {
  ThemeSetting get theme => throw _privateConstructorUsedError;
  DefaultTheme get defaultLightTheme => throw _privateConstructorUsedError;
  DefaultTheme get defaultDarkTheme => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ThemeSettingsModelCopyWith<ThemeSettingsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThemeSettingsModelCopyWith<$Res> {
  factory $ThemeSettingsModelCopyWith(
          ThemeSettingsModel value, $Res Function(ThemeSettingsModel) then) =
      _$ThemeSettingsModelCopyWithImpl<$Res, ThemeSettingsModel>;
  @useResult
  $Res call(
      {ThemeSetting theme,
      DefaultTheme defaultLightTheme,
      DefaultTheme defaultDarkTheme});
}

/// @nodoc
class _$ThemeSettingsModelCopyWithImpl<$Res, $Val extends ThemeSettingsModel>
    implements $ThemeSettingsModelCopyWith<$Res> {
  _$ThemeSettingsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? theme = null,
    Object? defaultLightTheme = null,
    Object? defaultDarkTheme = null,
  }) {
    return _then(_value.copyWith(
      theme: null == theme
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as ThemeSetting,
      defaultLightTheme: null == defaultLightTheme
          ? _value.defaultLightTheme
          : defaultLightTheme // ignore: cast_nullable_to_non_nullable
              as DefaultTheme,
      defaultDarkTheme: null == defaultDarkTheme
          ? _value.defaultDarkTheme
          : defaultDarkTheme // ignore: cast_nullable_to_non_nullable
              as DefaultTheme,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ThemeSettingsModelImplCopyWith<$Res>
    implements $ThemeSettingsModelCopyWith<$Res> {
  factory _$$ThemeSettingsModelImplCopyWith(_$ThemeSettingsModelImpl value,
          $Res Function(_$ThemeSettingsModelImpl) then) =
      __$$ThemeSettingsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ThemeSetting theme,
      DefaultTheme defaultLightTheme,
      DefaultTheme defaultDarkTheme});
}

/// @nodoc
class __$$ThemeSettingsModelImplCopyWithImpl<$Res>
    extends _$ThemeSettingsModelCopyWithImpl<$Res, _$ThemeSettingsModelImpl>
    implements _$$ThemeSettingsModelImplCopyWith<$Res> {
  __$$ThemeSettingsModelImplCopyWithImpl(_$ThemeSettingsModelImpl _value,
      $Res Function(_$ThemeSettingsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? theme = null,
    Object? defaultLightTheme = null,
    Object? defaultDarkTheme = null,
  }) {
    return _then(_$ThemeSettingsModelImpl(
      theme: null == theme
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as ThemeSetting,
      defaultLightTheme: null == defaultLightTheme
          ? _value.defaultLightTheme
          : defaultLightTheme // ignore: cast_nullable_to_non_nullable
              as DefaultTheme,
      defaultDarkTheme: null == defaultDarkTheme
          ? _value.defaultDarkTheme
          : defaultDarkTheme // ignore: cast_nullable_to_non_nullable
              as DefaultTheme,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ThemeSettingsModelImpl implements _ThemeSettingsModel {
  const _$ThemeSettingsModelImpl(
      {required this.theme,
      required this.defaultLightTheme,
      required this.defaultDarkTheme});

  factory _$ThemeSettingsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ThemeSettingsModelImplFromJson(json);

  @override
  final ThemeSetting theme;
  @override
  final DefaultTheme defaultLightTheme;
  @override
  final DefaultTheme defaultDarkTheme;

  @override
  String toString() {
    return 'ThemeSettingsModel(theme: $theme, defaultLightTheme: $defaultLightTheme, defaultDarkTheme: $defaultDarkTheme)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ThemeSettingsModelImpl &&
            (identical(other.theme, theme) || other.theme == theme) &&
            (identical(other.defaultLightTheme, defaultLightTheme) ||
                other.defaultLightTheme == defaultLightTheme) &&
            (identical(other.defaultDarkTheme, defaultDarkTheme) ||
                other.defaultDarkTheme == defaultDarkTheme));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, theme, defaultLightTheme, defaultDarkTheme);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ThemeSettingsModelImplCopyWith<_$ThemeSettingsModelImpl> get copyWith =>
      __$$ThemeSettingsModelImplCopyWithImpl<_$ThemeSettingsModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ThemeSettingsModelImplToJson(
      this,
    );
  }
}

abstract class _ThemeSettingsModel implements ThemeSettingsModel {
  const factory _ThemeSettingsModel(
      {required final ThemeSetting theme,
      required final DefaultTheme defaultLightTheme,
      required final DefaultTheme defaultDarkTheme}) = _$ThemeSettingsModelImpl;

  factory _ThemeSettingsModel.fromJson(Map<String, dynamic> json) =
      _$ThemeSettingsModelImpl.fromJson;

  @override
  ThemeSetting get theme;
  @override
  DefaultTheme get defaultLightTheme;
  @override
  DefaultTheme get defaultDarkTheme;
  @override
  @JsonKey(ignore: true)
  _$$ThemeSettingsModelImplCopyWith<_$ThemeSettingsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SettingsModel _$SettingsModelFromJson(Map<String, dynamic> json) {
  return _SettingsModel.fromJson(json);
}

/// @nodoc
mixin _$SettingsModel {
  ThemeSettingsModel get themeSettings => throw _privateConstructorUsedError;
  FontSettingsModel get fontSettings => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SettingsModelCopyWith<SettingsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsModelCopyWith<$Res> {
  factory $SettingsModelCopyWith(
          SettingsModel value, $Res Function(SettingsModel) then) =
      _$SettingsModelCopyWithImpl<$Res, SettingsModel>;
  @useResult
  $Res call({ThemeSettingsModel themeSettings, FontSettingsModel fontSettings});

  $ThemeSettingsModelCopyWith<$Res> get themeSettings;
  $FontSettingsModelCopyWith<$Res> get fontSettings;
}

/// @nodoc
class _$SettingsModelCopyWithImpl<$Res, $Val extends SettingsModel>
    implements $SettingsModelCopyWith<$Res> {
  _$SettingsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? themeSettings = null,
    Object? fontSettings = null,
  }) {
    return _then(_value.copyWith(
      themeSettings: null == themeSettings
          ? _value.themeSettings
          : themeSettings // ignore: cast_nullable_to_non_nullable
              as ThemeSettingsModel,
      fontSettings: null == fontSettings
          ? _value.fontSettings
          : fontSettings // ignore: cast_nullable_to_non_nullable
              as FontSettingsModel,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ThemeSettingsModelCopyWith<$Res> get themeSettings {
    return $ThemeSettingsModelCopyWith<$Res>(_value.themeSettings, (value) {
      return _then(_value.copyWith(themeSettings: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $FontSettingsModelCopyWith<$Res> get fontSettings {
    return $FontSettingsModelCopyWith<$Res>(_value.fontSettings, (value) {
      return _then(_value.copyWith(fontSettings: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SettingsModelImplCopyWith<$Res>
    implements $SettingsModelCopyWith<$Res> {
  factory _$$SettingsModelImplCopyWith(
          _$SettingsModelImpl value, $Res Function(_$SettingsModelImpl) then) =
      __$$SettingsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ThemeSettingsModel themeSettings, FontSettingsModel fontSettings});

  @override
  $ThemeSettingsModelCopyWith<$Res> get themeSettings;
  @override
  $FontSettingsModelCopyWith<$Res> get fontSettings;
}

/// @nodoc
class __$$SettingsModelImplCopyWithImpl<$Res>
    extends _$SettingsModelCopyWithImpl<$Res, _$SettingsModelImpl>
    implements _$$SettingsModelImplCopyWith<$Res> {
  __$$SettingsModelImplCopyWithImpl(
      _$SettingsModelImpl _value, $Res Function(_$SettingsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? themeSettings = null,
    Object? fontSettings = null,
  }) {
    return _then(_$SettingsModelImpl(
      themeSettings: null == themeSettings
          ? _value.themeSettings
          : themeSettings // ignore: cast_nullable_to_non_nullable
              as ThemeSettingsModel,
      fontSettings: null == fontSettings
          ? _value.fontSettings
          : fontSettings // ignore: cast_nullable_to_non_nullable
              as FontSettingsModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SettingsModelImpl implements _SettingsModel {
  const _$SettingsModelImpl(
      {required this.themeSettings, required this.fontSettings});

  factory _$SettingsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SettingsModelImplFromJson(json);

  @override
  final ThemeSettingsModel themeSettings;
  @override
  final FontSettingsModel fontSettings;

  @override
  String toString() {
    return 'SettingsModel(themeSettings: $themeSettings, fontSettings: $fontSettings)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SettingsModelImpl &&
            (identical(other.themeSettings, themeSettings) ||
                other.themeSettings == themeSettings) &&
            (identical(other.fontSettings, fontSettings) ||
                other.fontSettings == fontSettings));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, themeSettings, fontSettings);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SettingsModelImplCopyWith<_$SettingsModelImpl> get copyWith =>
      __$$SettingsModelImplCopyWithImpl<_$SettingsModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SettingsModelImplToJson(
      this,
    );
  }
}

abstract class _SettingsModel implements SettingsModel {
  const factory _SettingsModel(
      {required final ThemeSettingsModel themeSettings,
      required final FontSettingsModel fontSettings}) = _$SettingsModelImpl;

  factory _SettingsModel.fromJson(Map<String, dynamic> json) =
      _$SettingsModelImpl.fromJson;

  @override
  ThemeSettingsModel get themeSettings;
  @override
  FontSettingsModel get fontSettings;
  @override
  @JsonKey(ignore: true)
  _$$SettingsModelImplCopyWith<_$SettingsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
