/*
  Language: Dart
  IDE: IntelliJ IDEA Flutter Plugin
  File: main.dart
  Assigned To: Colby
  Requirements: 6.1 Home Page
  Purpose: This is the code that starts the application and directs to the
  home page.
*/


import "package:flutter/material.dart";
import "package:campus_companion/frontend/home.dart";


void main() {
  runApp(const CampusCompanionApp());
}


class CampusCompanionApp extends StatelessWidget {
  const CampusCompanionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Campus Companion App",
      theme: ThemeData(
      ),
      home: HomeScreen()
    );
  }
}