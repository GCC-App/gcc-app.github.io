/*
  Language: Dart
  IDE: IntelliJ IDEA Flutter Plugin
  File: features.dart
  Assigned To: Colby
  Requirements: 7.1 Features
  Purpose:
*/


import "package:flutter/material.dart";
import "package:campus_companion/frontend/interactive_maps.dart";

class FeaturesScreen extends StatelessWidget {

  const FeaturesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Features Screen")),

      body: Center(

        child: ElevatedButton(

          child: const Text("Interactive Maps"),

          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (context) => const InteractiveMapsScreen(),
              ),
            );
          }
        )
      )
    );
  }
}