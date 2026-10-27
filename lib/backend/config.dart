/*
  Language: Dart
  IDE: IntelliJ IDEA Flutter Plugin
  File: config.dart
  Assigned To: Chris
  Requirements: 4.1 Global Settings
  Purpose: This file provides all constant values for the frontend theme,
  including font, font size, and color.
 */


import 'package:flutter/material.dart';


@immutable
class AppStyles {

  static final double minContrastLevel = -1.0;
  static final double maxContrastLevel = 1.0;

  final Color seedColor;
  final Brightness colorMode;
  final double contrastLevel;

  static const TextStyle titleStyle = TextStyle (
      fontSize : 32,
      fontWeight : FontWeight.bold
  );

  static const TextStyle headerStyle = TextStyle (
      fontSize : 24,
      fontWeight: FontWeight.bold
  );

  static const TextStyle bodyStyle = TextStyle (
    fontSize : 16,
  );

  static const TextStyle captionStyle = TextStyle (
      fontSize : 16,
      fontStyle : FontStyle.italic
  );

  // Constant constructor
  const AppStyles ({

    this.seedColor = Colors.tealAccent,
    this.colorMode = Brightness.light,
    this.contrastLevel = 0.0,

  });

  // Copy a new instance to change attributes
  AppStyles copyWith({

    Color? seedColor,
    Brightness? colorMode,
    double? contrastLevel

  }) {

    return AppStyles (
      seedColor: seedColor ?? this.seedColor,
      colorMode: colorMode ?? this.colorMode,
      contrastLevel: contrastLevel ?? this.contrastLevel
    );
  }

  ColorScheme get colorScheme => ColorScheme.fromSeed(

      seedColor: seedColor,
      brightness: colorMode,
      contrastLevel: contrastLevel
  );

  TextTheme get textTheme => TextTheme(

    displayLarge: titleStyle,
    displayMedium: headerStyle,
    displaySmall: bodyStyle,

    labelSmall: captionStyle
  );

  AppBarTheme get appBarTheme => AppBarTheme(

  backgroundColor: colorScheme.primary,
  foregroundColor: colorScheme.onPrimary,

  titleTextStyle: TextTheme().displayLarge,
  );

  ElevatedButtonThemeData get buttonTheme => ElevatedButtonThemeData(

    style: ElevatedButton.styleFrom(

    backgroundColor: colorScheme.primaryContainer,
    foregroundColor: colorScheme.onPrimaryContainer

    )
  );

  ThemeData get appTheme => ThemeData(

    colorScheme: colorScheme,
    textTheme: textTheme,
    appBarTheme: appBarTheme,
    elevatedButtonTheme: buttonTheme

  );
}


class StylesController extends ValueNotifier<AppStyles> {

  StylesController(super.value);

  // Methods to change theme
  void isDarkMode(bool isDarkMode) {
    Brightness newColorMode = isDarkMode ? Brightness.dark : Brightness.light;
    value =
        value.copyWith(colorMode: newColorMode);
  }

  void updateContrast(double newContrastLevel) {
    value =
        value.copyWith(contrastLevel: newContrastLevel);
  }

  // Chaining shortcuts
  Color get seedColor => value.seedColor;
  Brightness get colorMode => value.colorMode;
  double get contrastLevel => value.contrastLevel;
  ColorScheme get colorScheme => value.colorScheme;

  TextStyle? get titleStyle => value.textTheme.displayLarge;
  TextStyle? get headerStyle => value.textTheme.displayMedium;
  TextStyle? get bodyStyle => value.textTheme.displaySmall;
  TextStyle? get captionStyle => value.textTheme.labelSmall;

  ThemeData get appTheme => value.appTheme;
}

// Controller instance
final stylesController = StylesController(AppStyles());