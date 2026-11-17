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
      appBar: stylesController.createAppBar("Settings Screen"),

      body: Center (
        child: Column(

          children: [
            Text("TODO: Clear User Data Button",
                style:
                  stylesController.titleStyle?.copyWith(color: Colors.red)),

            // Dark mode switch
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


            // Change Color text fields
            //
            // // R value
            // ConstrainedBox(
            //
            //  constraints: const BoxConstraints(maxWidth: 200),
            //
            //  child: TextFormField(
            //
            //    initialValue: AppStyles.defaultColorR.toString(),
            //
            //    decoration: InputDecoration(
            //      border: OutlineInputBorder(),
            //      labelText: "R value",
            //    ),
            //
            //    // Only allow integer input
            //    keyboardType: TextInputType.number,
            //    inputFormatters: <TextInputFormatter>[
            //      FilteringTextInputFormatter.digitsOnly
            //    ],
            //
            //    autovalidateMode: AutovalidateMode.onUserInteraction,
            //    validator: (value) {
            //
            //     if (value == null  || value.isEmpty) {
            //       return "Enter a value";
            //
            //     } else {
            //       int intValue = int.parse(value);
            //
            //       // Integer input does not allow negative numbers.
            //       if (intValue > 255) {
            //         return "Invalid RGB value";
            //       }
            //     }
            //
            //     return null;
            //    },
            //
            //    onChanged: (value) {
            //
            //      final intValue = int.tryParse(value);
            //      if (intValue != null) {
            //        setState(() {
            //         stylesController.changeR(intValue);
            //        });
            //      }
            //    }
            //
            //
            //  ),
            // ),
            //
            // // G value
            // ConstrainedBox(
            //
            //   constraints: const BoxConstraints(maxWidth: 200),
            //
            //   child: TextFormField(
            //
            //       initialValue: AppStyles.defaultColorR.toString(),
            //
            //       decoration: InputDecoration(
            //         border: OutlineInputBorder(),
            //         labelText: "G value",
            //       ),
            //
            //       // Only allow integer input
            //       keyboardType: TextInputType.number,
            //       inputFormatters: <TextInputFormatter>[
            //         FilteringTextInputFormatter.digitsOnly
            //       ],
            //
            //       autovalidateMode: AutovalidateMode.onUserInteraction,
            //       validator: (value) {
            //
            //         if (value == null  || value.isEmpty) {
            //           return "Enter a value";
            //
            //         } else {
            //           int intValue = int.parse(value);
            //
            //           // Integer input does not allow negative numbers.
            //           if (intValue > 255) {
            //             return "Invalid RGB value";
            //           }
            //         }
            //
            //         return null;
            //       },
            //
            //       onChanged: (value) {
            //
            //         final intValue = int.tryParse(value);
            //         if (intValue != null) {
            //           setState(() {
            //             stylesController.changeG(intValue);
            //           });
            //         }
            //       }
            //
            //
            //   ),
            // ),
            //
            // // B value
            // ConstrainedBox(
            //
            //   constraints: const BoxConstraints(maxWidth: 200),
            //
            //   child: TextFormField(
            //
            //       initialValue: AppStyles.defaultColorR.toString(),
            //
            //       decoration: InputDecoration(
            //         border: OutlineInputBorder(),
            //         labelText: "B value",
            //       ),
            //
            //       // Only allow integer input
            //       keyboardType: TextInputType.number,
            //       inputFormatters: <TextInputFormatter>[
            //         FilteringTextInputFormatter.digitsOnly
            //       ],
            //
            //       autovalidateMode: AutovalidateMode.onUserInteraction,
            //       validator: (value) {
            //
            //         if (value == null  || value.isEmpty) {
            //           return "Enter a value";
            //
            //         } else {
            //           int intValue = int.parse(value);
            //
            //           // Integer input does not allow negative numbers.
            //           if (intValue > 255) {
            //             return "Invalid RGB value";
            //           }
            //         }
            //
            //         return null;
            //       },
            //
            //       onChanged: (value) {
            //
            //         final intValue = int.tryParse(value);
            //         if (intValue != null) {
            //           setState(() {
            //             stylesController.changeB(intValue);
            //           });
            //         }
            //       }
            //
            //
            //   ),
            // ),

            // Change R slider
            Text("R value:", style: stylesController.titleStyle),

            Slider(

              value: stylesController.colorR.toDouble(),
              min: AppStyles.minRGBValue.toDouble(),
              max: AppStyles.maxRGBValue.toDouble(),

              divisions: AppStyles.maxRGBValue,
              label: stylesController.colorR.toString(),

              onChanged: (double newValue) {
                setState(() {
                  stylesController.updateR(newValue.round());
                });
              }
            ),

            // Change G slider
            Text("G value:", style: stylesController.titleStyle),

            Slider(

                value: stylesController.colorG.toDouble(),
                min: AppStyles.minRGBValue.toDouble(),
                max: AppStyles.maxRGBValue.toDouble(),

                divisions: AppStyles.maxRGBValue,
                label: stylesController.colorG.toString(),

                onChanged: (double newValue) {
                  setState(() {
                    stylesController.updateG(newValue.round());
                  });
                }
            ),


            // Change B slider
            Text("B value:", style: stylesController.titleStyle),

            Slider(

                value: stylesController.colorB.toDouble(),
                min: AppStyles.minRGBValue.toDouble(),
                max: AppStyles.maxRGBValue.toDouble(),

                divisions: AppStyles.maxRGBValue,
                label: stylesController.colorB.toString(),

                onChanged: (double newValue) {
                  setState(() {
                    stylesController.updateB(newValue.round());
                  });
                }
            ),


            // Change contrast level slider
            Text("Contrast Level:",
                style: stylesController.titleStyle),

            Slider(

              value: stylesController.contrastLevel,
              min: AppStyles.minContrastLevel,
              max: AppStyles.maxContrastLevel,

              divisions: 1000,
              label: stylesController.contrastLevel.toStringAsFixed(3),

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
