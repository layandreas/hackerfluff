import 'package:flutter/material.dart';

const textTheme = TextTheme(
  titleLarge: TextStyle(fontSize: 16),
);

const fontFamily = "SourceSans3";
const orange = Color.fromARGB(255, 217, 93, 5);

class Themes {
  final lightTheme = ThemeData(
      fontFamily: fontFamily,
      textTheme: textTheme,
      brightness: Brightness.light,
      colorScheme: const ColorScheme.light().copyWith(
        primary: orange,
        secondary: const Color(0xFFC20E5E),
      ));

  final themeDark = ThemeData(
      fontFamily: fontFamily,
      brightness: Brightness.dark,
      textTheme: textTheme,
      colorScheme: const ColorScheme(
        primary: orange,
        secondary: Color(0xFFC20E5E),
        surface: Color.fromARGB(255, 16, 20, 24),
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
        surfaceContainerHighest: Color(0xFF43474E),
        surfaceTint: Color(0xFF9ECAFF),
        scrim: Color(0xFF000000),
        outline: Color(0xFF8D9199),
        outlineVariant: Color(0xFF43474E),
        shadow: Color(0xFF000000),
        inversePrimary: Color(0xFF0061A4),
        inverseSurface: Color(0xFFE2E2E6),
        onInverseSurface: Color(0xFF2F3033),
      ));

  final themeDarker = ThemeData(
      fontFamily: fontFamily,
      brightness: Brightness.dark,
      textTheme: textTheme,
      colorScheme: const ColorScheme(
        primary: orange,
        secondary: Color(0xFFC20E5E),
        surface: Color.fromARGB(255, 15, 15, 15),
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
        surfaceContainerHighest: Color(0xFF43474E),
        surfaceTint: Color(0xFF9ECAFF),
        scrim: Color(0xFF000000),
        outline: Color(0xFF8D9199),
        outlineVariant: Color(0xFF43474E),
        shadow: Color(0xFF000000),
        inversePrimary: Color(0xFF0061A4),
        inverseSurface: Color(0xFFE2E2E6),
        onInverseSurface: Color(0xFF2F3033),
      ));

  final themeOledDark = ThemeData(
      fontFamily: fontFamily,
      brightness: Brightness.dark,
      textTheme: textTheme,
      colorScheme: const ColorScheme(
        primary: Color(0xFFC20E5E),
        secondary: Color(0xFFC20E5E),
        surface: Color(0xFF000000),
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
        surfaceContainerHighest: Color(0xFF43474E),
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
      fontFamily: fontFamily,
      brightness: Brightness.dark,
      textTheme: textTheme,
      colorScheme: const ColorScheme(
        primary: Color(0xFF9ECAFF),
        secondary: Color(0xFFBBC7DB),
        surface: Color(0xFF00131F),
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
        surfaceContainerHighest: Color(0xFF43474E),
        surfaceTint: Color(0xFF9ECAFF),
        scrim: Color(0xFF000000),
        outline: Color(0xFF8D9199),
        outlineVariant: Color(0xFF43474E),
        shadow: Color(0xFF000000),
        inversePrimary: Color(0xFF0061A4),
        inverseSurface: Color(0xFFE2E2E6),
        onInverseSurface: Color(0xFF2F3033),
      ));
}
