import 'package:flutter/material.dart';
import 'kennesaw_map.dart';
import 'marietta_map.dart';
import 'bus_routes.dart';

class MapsScreen extends StatefulWidget {
  const MapsScreen({super.key});

  @override
  State<MapsScreen> createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {
  String selectedMap = 'Kennesaw Campus';

  final List<String> mapOptions = [
    'Kennesaw Campus',
    'Marietta Campus',
    'Bus Routes',
  ];

  Widget buildSelectedMap() {
    switch (selectedMap) {
      case 'Kennesaw Campus':
        return const KennesawMap();

      case 'Marietta Campus':
        return const MariettaMap();

      case 'Bus Routes':
        return const BusRoutesScreen();

      default:
        return const Center(
          child: Text('Select a map'),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Campus Maps'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Select Map',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            DropdownButtonFormField<String>(
              initialValue: selectedMap,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Campus Map',
              ),
              items: mapOptions.map((String map) {
                return DropdownMenuItem<String>(
                  value: map,
                  child: Text(map),
                );
              }).toList(),
              onChanged: (String? newMap) {
                if (newMap != null) {
                  setState(() {
                    selectedMap = newMap;
                  });
                }
              },
            ),

            const SizedBox(height: 20),

            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: buildSelectedMap(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}