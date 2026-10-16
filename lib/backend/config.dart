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

  static const backgroundColor = Colors.blue;

  static const titleStyle = TextStyle (
    fontSize : 32,
    fontWeight : FontWeight.bold
  );

  static const headerStyle = TextStyle (
    fontSize : 24,
    fontWeight: FontWeight.bold
  );

  static const bodyStyle = TextStyle (
    fontSize : 16,
  );

  static const captionStyle = TextStyle (
    fontSize : 16,
    fontStyle : FontStyle.italic
  );

}

