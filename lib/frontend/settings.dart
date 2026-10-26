/*
  Language: Dart
  IDE: IntelliJ IDEA Flutter Plugin
  File: settings.dart
  Assigned To: Chris
  Requirements: 4.1 Global Settings
  Purpose: This is the frontend file that allows users to change
  config.dart as well as for users to manage their data.
 */

import "package:flutter/material.dart";
import "package:campus_companion/backend/config.dart";

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => SettingsScreenState();
}

class SettingsScreenState extends State<SettingsScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Settings Screen")),

      body: Center (
        child: Column(

          children: [

            Slider(

              value: AppStyles.contrastLevel,
              min: AppStyles.minContrastLevel,
              max: AppStyles.maxContrastLevel,
              label: AppStyles.contrastLevel.toStringAsFixed(2),

              onChanged: (double newValue) {
                setState(() {
                  updateContrast(newValue);
                });
              }
            )

          ]

        )
      )
    );
  }
}
