/*
  Language: Dart
  IDE: IntelliJ IDEA Flutter Plugin
  File: nav.dart
  Assigned To: Chris
  Requirements: 3.1 Navigation Bar
  Purpose:
*/

import 'package:campus_companion/frontend/features.dart';
import 'package:campus_companion/frontend/home.dart';
import 'package:campus_companion/frontend/interactive_maps.dart';
import 'package:campus_companion/frontend/settings.dart';
import 'package:flutter/material.dart';


// Use this when setting the index
enum Screens {home, features, interactiveMaps, settings}

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => NavBarState();
}

class NavBarState extends State<NavBar> {

  // List all implemented screens here.
  final List<Widget> _screenList = const [
    HomeScreen(),
    FeaturesScreen(),
    InteractiveMapsScreen(),
    SettingsScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int> (
        valueListenable: navController,
        builder: (context, currIndex, child) {

      return Scaffold(

        body: IndexedStack(
            index: currIndex,
            children: _screenList
        ),

        bottomNavigationBar: NavigationBar(

          selectedIndex: currIndex,

          onDestinationSelected: (int newIndex) {

            navController.value = newIndex;

            setState(() {
              currIndex = newIndex;
            });
          },

          // Icons and labels
          destinations: const [

            NavigationDestination(
                icon: Icon(Icons.home_outlined),
                selectedIcon: Icon(Icons.home),
                label: "Home"
            ),

            NavigationDestination(
                icon: Icon(Icons.search_outlined),
                selectedIcon: Icon(Icons.search),
                label: "Features"
            ),

            NavigationDestination(
                icon: Icon(Icons.map_outlined),
                selectedIcon: Icon(Icons.map),
                label: "Interactive Maps"
            ),

            NavigationDestination(
                icon: Icon(Icons.settings_outlined),
                selectedIcon: Icon(Icons.settings),
                label: "Settings"
            )
          ],
        ),
      );
      }
    );
  }
}

// Change the index of the screen in the navbar class.
class NavController extends ValueNotifier<int> {
  NavController([super.value = 0]);

  final Map<Screens, int> _screenToIndexMap = {

    Screens.home : 0,
    Screens.features : 1,
    Screens.interactiveMaps : 2,
    Screens.settings : 3
  };

  // Use this method when using buttons to link to another screen.
  void updateButtonNav(Screens screen) {
    value = _screenToIndexMap[screen]!;
  }
}

final navController = NavController();