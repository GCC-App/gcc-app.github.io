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

abstract class AppStyles {

  static var seedColor = Colors.tealAccent;
  static var colorMode = Brightness.light;
  static var contrastLevel = 0.0;

  static const minContrastLevel = -1.0;
  static const maxContrastLevel = 1.0;

  static var titleStyle = TextStyle (
    fontSize : 32,
    fontWeight : FontWeight.bold
  );

  static var headerStyle = TextStyle (
    fontSize : 24,
    fontWeight: FontWeight.bold
  );

  static var bodyStyle = TextStyle (
    fontSize : 16,
  );

  static var captionStyle = TextStyle (
    fontSize : 16,
    fontStyle : FontStyle.italic
  );

  static ColorScheme colorScheme = ColorScheme.fromSeed(

      seedColor: seedColor,
      brightness: colorMode,
      contrastLevel: contrastLevel
  );

  static TextTheme textTheme = TextTheme(

    displayLarge: titleStyle,
    displayMedium: headerStyle,
    displaySmall: bodyStyle,

    labelSmall: captionStyle
  );

  static AppBarTheme appBarTheme = AppBarTheme(

    backgroundColor: colorScheme.primary,
    foregroundColor: colorScheme.onPrimary,

    titleTextStyle: TextTheme().displayLarge,
  );

  static ElevatedButtonThemeData buttonTheme = ElevatedButtonThemeData(

    style: ElevatedButton.styleFrom(

      backgroundColor: colorScheme.primaryContainer,
      foregroundColor: colorScheme.onPrimaryContainer

    )
  );
}


final ValueNotifier<ThemeData> themeNotifier = ValueNotifier<ThemeData>(
    ThemeData(

        colorScheme: AppStyles.colorScheme,
        textTheme: AppStyles.textTheme,
        appBarTheme: AppStyles.appBarTheme,
        elevatedButtonTheme: AppStyles.buttonTheme

    )
);


void updateContrast(double newContrastLevel) {

  AppStyles.colorScheme = ColorScheme.fromSeed(
      seedColor: AppStyles.seedColor,
      brightness: AppStyles.colorMode,
      contrastLevel: newContrastLevel
  );

  themeNotifier.value = ThemeData(

      colorScheme: AppStyles.colorScheme,
      textTheme: AppStyles.textTheme,
      appBarTheme: AppStyles.appBarTheme,
      elevatedButtonTheme: AppStyles.buttonTheme
  );
}