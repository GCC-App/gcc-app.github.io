import 'package:flutter/material.dart';
import '../backend/maps.dart';

// Run app through homepage main.dart.
// void main() {
//   runApp(const CampusCompanionApp());
// }

class InteractiveMapsScreen extends StatelessWidget {
  const InteractiveMapsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Campus Companion',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
        ),
        useMaterial3: true,
      ),
      home: const MapsScreen(),
    );
  }
}