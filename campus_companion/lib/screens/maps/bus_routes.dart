import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';

class BusRoutesScreen extends StatefulWidget {
  const BusRoutesScreen({super.key});

  @override
  State<BusRoutesScreen> createState() => _BusRoutesScreenState();
}

class _BusRoutesScreenState extends State<BusRoutesScreen> {
  String selectedRoute = 'Kennesaw/Marietta Route';

  final Uri liveTrackerUrl =
      Uri.parse('https://kennesawstate.passiogo.com');

  final Map<String, Map<String, dynamic>> routes = {
    'Kennesaw/Marietta Route': {
      'description': 'Connects Kennesaw Campus and Marietta Campus.',
      'hours': 'Mon–Thu: 7:00 AM–11:30 PM\n'
          'Friday: 7:00 AM–7:00 PM\n'
          'Saturday: 12:00 PM–7:00 PM',
      'stops': [
        {
          'name': 'Rec Center',
          'campus': 'Kennesaw Campus',
        },
        {
          'name': 'The Commons',
          'campus': 'Kennesaw Campus',
        },
        {
          'name': 'Joe Mack Wilson Student Center',
          'campus': 'Marietta Campus',
        },
      ],
    },
    'Kennesaw Loop Route': {
      'description': 'Circulates around Kennesaw Campus.',
      'hours': 'Mon–Thu: 7:00 AM–11:00 PM\n'
          'Friday: 7:00 AM–7:00 PM',
      'stops': [
        {'name': 'Rec Center', 'campus': 'Kennesaw Campus'},
        {'name': 'The Commons', 'campus': 'Kennesaw Campus'},
        {'name': 'North Residential', 'campus': 'Kennesaw Campus'},
        {'name': 'Summit Complex', 'campus': 'Kennesaw Campus'},
      ],
    },
    
    'Marietta Loop Route': {
      'description': 'Circulates around Marietta Campus.',
      'hours': 'Monday–Friday: 7:30 AM–6:00 PM',
      'stops': [
        {
          'name': 'Shore Center',
          'campus': 'Marietta Campus',
        },
        {
          'name': 'Hornet Village',
          'campus': 'Marietta Campus',
        },
        {
          'name': 'University Columns',
          'campus': 'Marietta Campus',
        },
        {
          'name': 'Hornet Hub',
          'campus': 'Marietta Campus',
        },
      ],
    },
  };

  Future<void> _openLiveTracker() async {
    try {
      final launched = await launchUrl(
        liveTrackerUrl,
        mode: LaunchMode.externalApplication,
      );

      if (!launched && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Could not open the live shuttle tracker.'),
          ),
        );
      }
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Could not open the live shuttle tracker.'),
          ),
        );
      }
    }
  }

  
  Widget _buildStopsMap() {
    final isIntercampus = selectedRoute == 'Kennesaw/Marietta Route';
    final isKennesaw = selectedRoute == 'Kennesaw Loop Route';
    final isMarietta = selectedRoute == 'Marietta Loop Route';

    final markers = <Marker>[];

    if (isKennesaw) {
      markers.addAll([
        Marker(
          point: const LatLng(34.039665, -84.582461),
          width: 140,
          height: 65,
          child: const Column(
            children: [
              Icon(Icons.location_on, color: Colors.red, size: 32),
              Flexible(
                child: Text(
                  'The Commons',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 11,
                    backgroundColor: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        Marker(
          point: const LatLng(34.037324, -84.582509),
          width: 150,
          height: 65,
          child: const Column(
            children: [
              Icon(Icons.location_on, color: Colors.red, size: 32),
              Flexible(
                child: Text(
                  'Rec Center',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 11,
                    backgroundColor: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        Marker(
          point: const LatLng(34.041554, -84.584234),
          width: 150,
          height: 65,
          child: const Column(
            children: [
              Icon(Icons.location_on, color: Colors.red, size: 32),
              Flexible(
                child: Text(
                  'North Residential',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 11,
                    backgroundColor: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        Marker(
          point: const LatLng(34.034328, -84.584639),
          width: 150,
          height: 65,
          child: const Column(
            children: [
              Icon(Icons.location_on, color: Colors.red, size: 32),
              Flexible(
                child: Text(
                  'Summit Complex',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 11,
                    backgroundColor: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ]);
    }

    
    if (isMarietta) {
      markers.addAll([
        Marker(
          point: const LatLng(33.940158, -84.518710),
          width: 140,
          height: 65,
          child: const Column(
            children: [
              Icon(Icons.location_on, color: Colors.red, size: 32),
              Flexible(
                child: Text(
                  'Shore Center',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 11,
                    backgroundColor: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        Marker(
          point: const LatLng(33.936106, -84.521328),
          width: 140,
          height: 65,
          child: const Column(
            children: [
              Icon(Icons.location_on, color: Colors.red, size: 32),
              Flexible(
                child: Text(
                  'Hornet Village',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 11,
                    backgroundColor: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        Marker(
          point: const LatLng(33.935716, -84.525040),
          width: 150,
          height: 65,
          child: const Column(
            children: [
              Icon(Icons.location_on, color: Colors.red, size: 32),
              Flexible(
                child: Text(
                  'University Columns',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 11,
                    backgroundColor: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        Marker(
          point: const LatLng(33.939415, -84.522074),
          width: 140,
          height: 65,
          child: const Column(
            children: [
              Icon(Icons.location_on, color: Colors.red, size: 32),
              Flexible(
                child: Text(
                  'Hornet Hub',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 11,
                    backgroundColor: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ]);
    }

    
    if (isIntercampus) {
      markers.addAll([
        Marker(
          point: const LatLng(34.037324, -84.582509),
          width: 150,
          height: 65,
          child: const Column(
            children: [
              Icon(Icons.location_on, color: Colors.red, size: 32),
              Flexible(
                child: Text(
                  'Rec Center',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 11,
                    backgroundColor: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        Marker(
          point: const LatLng(34.039665, -84.582461),
          width: 140,
          height: 65,
          child: const Column(
            children: [
              Icon(Icons.location_on, color: Colors.red, size: 32),
              Flexible(
                child: Text(
                  'The Commons',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 11,
                    backgroundColor: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        Marker(
          point: const LatLng(33.941024, -84.519898),
          width: 190,
          height: 65,
          child: const Column(
            children: [
              Icon(Icons.location_on, color: Colors.red, size: 32),
              Flexible(
                child: Text(
                  'Joe Mack Wilson Student Center',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 11,
                    backgroundColor: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ]);
    }


    final center = isIntercampus
        ? const LatLng(33.9900, -84.5700)
        : isMarietta
            ? const LatLng(33.9406, -84.5204)
            : const LatLng(34.0385, -84.5828);


    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Stop Locations',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 8),
        const Text(
          'Markers show available reference locations only. '
          'They do not represent the actual shuttle path.',
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 320,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: FlutterMap(
              key: ValueKey(selectedRoute),
              options: MapOptions(
                initialCenter: center,
                initialZoom: isIntercampus ? 11 : isMarietta ? 15 : 16,
              ),
              children: [
                TileLayer(
                  urlTemplate:
                      'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName:
                      'com.gccapp.campuscompanion',
                ),
                MarkerLayer(markers: markers),
                RichAttributionWidget(
                  attributions: [
                    TextSourceAttribution('OpenStreetMap contributors'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final route = routes[selectedRoute]!;
    final stops = route['stops'] as List<Map<String, String>>;

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
            'Select a shuttle route to view its stops and service hours.',
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: FilledButton.icon(
              onPressed: _openLiveTracker,
              icon: const Icon(Icons.directions_bus),
              label: const Text('Open Live Shuttle Map'),
            ),
          ),
          const SizedBox(height: 20),
          DropdownButtonFormField<String>(
            value: selectedRoute,
            decoration: const InputDecoration(
              labelText: 'Select Route',
              border: OutlineInputBorder(),
            ),
            isExpanded: true,
            items: routes.keys.map((routeName) {
              return DropdownMenuItem<String>(
                value: routeName,
                child: Text(routeName),
              );
            }).toList(),
            onChanged: (value) {
              if (value != null) {
                setState(() {
                  selectedRoute = value;
                });
              }
            },
          ),
          const SizedBox(height: 20),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    selectedRoute,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  Text(route['description'] as String),
                  const SizedBox(height: 16),
                  const Divider(),
                  Text(
                    'Stops (${stops.length})',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  ...stops.asMap().entries.map((entry) {
                    final index = entry.key;
                    final stop = entry.value;

                    return ListTile(
                      leading: CircleAvatar(
                        child: Text('${index + 1}'),
                      ),
                      title: Text(stop['name']!),
                      subtitle: Text(stop['campus']!),
                    );
                  }),
                  const Divider(),
                  Text(
                    'Service Hours',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8),
                  Text(route['hours'] as String),
                  const SizedBox(height: 20),
                  const Divider(),
                  _buildStopsMap(),
                  const SizedBox(height: 16),
                  const Text(
                    'Schedules may change. Check the official KSU '
                    'shuttle tracker for current service information.',
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
