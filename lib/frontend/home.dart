import "package:flutter/material.dart";
import "package:campus_companion/frontend/features.dart";


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Home Screen")),

        body: Center(

            child: ElevatedButton(

                child: const Text("Features"),

                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (context) => const FeaturesScreen(),
                    ),
                  );
                }
            )
        )
    );
  }
}
