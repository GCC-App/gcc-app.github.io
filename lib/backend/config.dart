/*
  Language: Dart
  IDE: IntelliJ IDEA Flutter Plugin
  File: config.dart
  Assigned To: Chris
  Requirements: 4.1 Global Settings
  Purpose: This file provides all constant values for the frontend theme,
  including font, font size, and color.
 */


import 'package:campus_companion/backend/nav.dart';
import 'package:flutter/material.dart';


@immutable
class AppStyles {

  static final double minContrastLevel = -1.0;
  static final double maxContrastLevel = 1.0;

  static final int minRGBValue = 0;
  static final int maxRGBValue = 255;

  final int colorR;
  final int colorG;
  final int colorB;

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

  static const defaultColorR = 248;
  static const defaultColorG = 247;
  static const defaultColorB = 240;

  // Constant constructor
  const AppStyles ({

    // Default initialized RGBO
    this.colorR = defaultColorR,
    this.colorG = defaultColorG,
    this.colorB = defaultColorB,

    // Default color scheme
    // this.seedColor = Colors.tealAccent,

    // Color.fromRGBO must be changed manually with const values rather than
    // from changing runtime values.
    this.seedColor =
      const Color.fromRGBO(
          defaultColorR, defaultColorG, defaultColorB, 1.0),

    this.colorMode = Brightness.light,
    this.contrastLevel = 0.0,

  });

  // Copy a new instance to change attributes
  AppStyles copyWith({

    int? colorR,
    int? colorG,
    int? colorB,

    Color? seedColor,
    Brightness? colorMode,
    double? contrastLevel

  }) {

    return AppStyles (

      colorR: colorR ?? this.colorR,
      colorG: colorG ?? this.colorG,
      colorB: colorB ?? this.colorB,

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

  // Back button
  ActionIconThemeData get actionIconTheme => ActionIconThemeData(
      backButtonIconBuilder: (BuildContext context) => const Icon(
          Icons.arrow_back_rounded,
          size: 24
      )
  );

  AppBarTheme get appBarTheme => AppBarTheme(

    backgroundColor: colorScheme.primary,
    foregroundColor: colorScheme.onPrimary,

    titleTextStyle: TextTheme().displayLarge,

    // Add underline style
    shape: Border(
      bottom: BorderSide(
        color: colorScheme.onPrimaryFixed,
        width: 10.0
      )

    ),

    // Back button color
    iconTheme: IconThemeData(
      color: colorScheme.onPrimaryFixed
    )

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
    actionIconTheme: actionIconTheme,
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


  void updateR(int newValue) {

    value = value.copyWith(

        colorR: newValue,

        seedColor: Color.fromRGBO(

            newValue,
            colorG,
            colorB,
            1.0));
  }

  void updateG(int newValue) {
    value = value.copyWith(

        colorG: newValue,

        seedColor: Color.fromRGBO(

            colorR,
            newValue,
            colorB,
            1.0));
  }

  void updateB(int newValue) {
    value = value.copyWith(

        colorB: newValue,

        seedColor: Color.fromRGBO(

            colorR,
            colorG,
            newValue,
            1.0));
  }

  // Method for AppBar field for each screen.
  AppBar createAppBar(String title) {
    return AppBar(
        title: Text(title),
        leading: BackButton(
          onPressed: () =>
            navController.updateButtonNav(navController.popLastScreen())
        )

    );
  }

  // Chaining shortcuts
  int get colorR => value.colorR;
  int get colorG => value.colorG;
  int get colorB => value.colorB;

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