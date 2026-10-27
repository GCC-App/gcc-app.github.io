/*
  Language: Dart
  IDE: IntelliJ IDEA Flutter Plugin
  File: features.dart
  Assigned To: Colby
  Requirements: 7.1 Features
  Purpose:
*/


import "package:campus_companion/backend/nav.dart";
import "package:flutter/material.dart";

class FeaturesScreen extends StatelessWidget {

  const FeaturesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Features Screen")),

      body: Center(
        child: Column(
          children: [

            ElevatedButton(
                child: const Text("Home Screen"),

                onPressed: () {
                  navController.updateButtonNav(Screens.home);
                }
            ),

            ElevatedButton(

              child: const Text("Interactive Maps"),

                onPressed: () {
                  navController.updateButtonNav(Screens.interactiveMaps);
                }
            ),

          ElevatedButton(
          child: const Text("Settings"),

            onPressed: () {
              navController.updateButtonNav(Screens.settings);
            }
          )
        ])
      )
    );
  }
}