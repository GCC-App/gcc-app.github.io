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

  bool isSwitchedDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Settings Screen")),

      body: Center (
        child: Column(

          children: [
            Text("TODO: Clear User Data Button",
                style:
                  stylesController.titleStyle?.copyWith(color: Colors.red)),
            Text("Enable Dark Mode:",
                style: stylesController.titleStyle),

            Switch(

              value: isSwitchedDarkMode,

              onChanged: (bool newValue) {
                setState(() {
                  stylesController.isDarkMode(newValue);
                  isSwitchedDarkMode = newValue;
                });
              },
            ),

            Text("Change Contrast Level:",
                style: stylesController.titleStyle),

            Slider(

              value: stylesController.contrastLevel,
              min: AppStyles.minContrastLevel,
              max: AppStyles.maxContrastLevel,

              onChanged: (double newValue) {
                setState(() {
                  stylesController.updateContrast(newValue);
                });
              }
            )

          ]

        )
      )
    );
  }
}
