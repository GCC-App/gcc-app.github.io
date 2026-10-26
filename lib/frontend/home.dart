/*
  Language: Dart
  IDE: IntelliJ IDEA Flutter Plugin
  File: home.dart
  Assigned To: Colby
  Requirements: 6.1 Home Page
  Purpose: This is the first screen that is run by main.dart. All other
  screens are accessed from this starting point.
*/


import "package:flutter/material.dart";
import "package:campus_companion/frontend/features.dart";
import "package:campus_companion/frontend/settings.dart";


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Home Screen")),

        body: Center(
          child: Column(
            children: [

              ElevatedButton(
                  child: const Text("Features"),

                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (context) => const FeaturesScreen(),
                      ),
                    );
                  }
              ),

              ElevatedButton(
                child: const Text("Settings"),

                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (context) => const SettingsScreen(),
                    ),
                  );
                }
              )
            ]
          )
        )
    );
  }
}
