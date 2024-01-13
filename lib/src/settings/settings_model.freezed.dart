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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ThemeSettingsModel _$ThemeSettingsModelFromJson(Map<String, dynamic> json) {
  return _ThemeSettingsModel.fromJson(json);
}

/// @nodoc
mixin _$ThemeSettingsModel {
  ThemeSetting? get theme => throw _privateConstructorUsedError;

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
  $Res call({ThemeSetting? theme});
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
    Object? theme = freezed,
  }) {
    return _then(_value.copyWith(
      theme: freezed == theme
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as ThemeSetting?,
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
  $Res call({ThemeSetting? theme});
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
    Object? theme = freezed,
  }) {
    return _then(_$ThemeSettingsModelImpl(
      theme: freezed == theme
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as ThemeSetting?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ThemeSettingsModelImpl implements _ThemeSettingsModel {
  const _$ThemeSettingsModelImpl({this.theme});

  factory _$ThemeSettingsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ThemeSettingsModelImplFromJson(json);

  @override
  final ThemeSetting? theme;

  @override
  String toString() {
    return 'ThemeSettingsModel(theme: $theme)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ThemeSettingsModelImpl &&
            (identical(other.theme, theme) || other.theme == theme));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, theme);

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
  const factory _ThemeSettingsModel({final ThemeSetting? theme}) =
      _$ThemeSettingsModelImpl;

  factory _ThemeSettingsModel.fromJson(Map<String, dynamic> json) =
      _$ThemeSettingsModelImpl.fromJson;

  @override
  ThemeSetting? get theme;
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
  ThemeSettingsModel? get themeSettings => throw _privateConstructorUsedError;

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
  $Res call({ThemeSettingsModel? themeSettings});

  $ThemeSettingsModelCopyWith<$Res>? get themeSettings;
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
    Object? themeSettings = freezed,
  }) {
    return _then(_value.copyWith(
      themeSettings: freezed == themeSettings
          ? _value.themeSettings
          : themeSettings // ignore: cast_nullable_to_non_nullable
              as ThemeSettingsModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ThemeSettingsModelCopyWith<$Res>? get themeSettings {
    if (_value.themeSettings == null) {
      return null;
    }

    return $ThemeSettingsModelCopyWith<$Res>(_value.themeSettings!, (value) {
      return _then(_value.copyWith(themeSettings: value) as $Val);
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
  $Res call({ThemeSettingsModel? themeSettings});

  @override
  $ThemeSettingsModelCopyWith<$Res>? get themeSettings;
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
    Object? themeSettings = freezed,
  }) {
    return _then(_$SettingsModelImpl(
      themeSettings: freezed == themeSettings
          ? _value.themeSettings
          : themeSettings // ignore: cast_nullable_to_non_nullable
              as ThemeSettingsModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SettingsModelImpl implements _SettingsModel {
  const _$SettingsModelImpl({this.themeSettings});

  factory _$SettingsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SettingsModelImplFromJson(json);

  @override
  final ThemeSettingsModel? themeSettings;

  @override
  String toString() {
    return 'SettingsModel(themeSettings: $themeSettings)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SettingsModelImpl &&
            (identical(other.themeSettings, themeSettings) ||
                other.themeSettings == themeSettings));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, themeSettings);

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
  const factory _SettingsModel({final ThemeSettingsModel? themeSettings}) =
      _$SettingsModelImpl;

  factory _SettingsModel.fromJson(Map<String, dynamic> json) =
      _$SettingsModelImpl.fromJson;

  @override
  ThemeSettingsModel? get themeSettings;
  @override
  @JsonKey(ignore: true)
  _$$SettingsModelImplCopyWith<_$SettingsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
