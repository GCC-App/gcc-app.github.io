
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class BusRoutesScreen extends StatefulWidget {
  const BusRoutesScreen({super.key});

  @override
  State<BusRoutesScreen> createState() =>
      _BusRoutesScreenState();
}

class _BusRoutesScreenState extends State<BusRoutesScreen> {
  bool showMap = false;

  final List<Map<String, dynamic>> stops = [
    {
      'name': 'Student Recreation and Activities Center',
      'campus': 'Kennesaw Campus',
      'position': const LatLng(34.0368, -84.5820),
    },
    {
      'name': 'The Commons',
      'campus': 'Kennesaw Campus',
      'position': const LatLng(34.0399, -84.5820),
    },
    {
      'name': 'Joe Mack Wilson Student Center',
      'campus': 'Marietta Campus',
      'position': const LatLng(33.9406, -84.5204),
    },
  ];

  Marker buildStopMarker(Map<String, dynamic> stop) {
    return Marker(
      point: stop['position'] as LatLng,
      width: 220,
      height: 70,
      child: GestureDetector(
        onTap: () {
          showModalBottomSheet(
            context: context,
            builder: (sheetContext) {
              return SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        stop['name'] as String,
                        style: Theme.of(sheetContext)
                            .textTheme
                            .titleLarge,
                      ),
                      const SizedBox(height: 8),
                      Text(stop['campus'] as String),
                      const SizedBox(height: 16),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            Navigator.pop(sheetContext);
                          },
                          child: const Text('Close'),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.location_on,
              color: Colors.red,
              size: 34,
            ),
            Flexible(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 5,
                  vertical: 2,
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context)
                      .colorScheme
                      .surface,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  stop['name'] as String,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildRouteMap() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    showMap = false;
                  });
                },
                icon: const Icon(Icons.arrow_back),
                tooltip: 'Back to bus route information',
              ),
              const Expanded(
                child: Text(
                  'Kennesaw/Marietta Shuttle Stops',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: FlutterMap(
            options: const MapOptions(
              initialCenter: LatLng(33.9895, -84.5515),
              initialZoom: 11,
            ),
            children: [
              TileLayer(
                urlTemplate:
                    'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName:
                    'com.gccapp.campuscompanion',
              ),
              MarkerLayer(
                markers: stops
                    .map((stop) => buildStopMarker(stop))
                    .toList(),
              ),
              RichAttributionWidget(
                attributions: [
                  TextSourceAttribution(
                    'OpenStreetMap contributors',
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    if (showMap) {
      return Scaffold(
        body: SafeArea(
          child: buildRouteMap(),
        ),
      );
    }

    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            'KSU Bus Routes',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 8),
          const Text(
            'Explore shuttle connections between '
            'Kennesaw Campus and Marietta Campus.',
          ),
          const SizedBox(height: 24),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Kennesaw/Marietta Route',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Connects Kennesaw Campus and '
                    'Marietta Campus.',
                  ),
                  const Divider(height: 24),
                  const ListTile(
                    leading: Icon(Icons.location_on),
                    title: Text(
                      'Student Recreation and Activities Center',
                    ),
                    subtitle: Text('Kennesaw Campus'),
                  ),
                  const ListTile(
                    leading: Icon(Icons.location_on),
                    title: Text('The Commons'),
                    subtitle: Text('Kennesaw Campus'),
                  ),
                  const ListTile(
                    leading: Icon(Icons.location_on),
                    title: Text('Joe Mack Wilson Student Center'),
                    subtitle: Text('Marietta Campus'),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Stop coordinates are preliminary. '
                    'Confirm stop locations and schedules '
                    'with official KSU shuttle information.',
                  ),
                  const SizedBox(height: 12),
                  FilledButton.icon(
                    onPressed: () {
                      setState(() {
                        showMap = true;
                      });
                    },
                    icon: const Icon(Icons.map),
                    label: const Text('Bus Route Map'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
