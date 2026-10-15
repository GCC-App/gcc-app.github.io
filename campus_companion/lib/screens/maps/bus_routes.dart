
import 'package:flutter/material.dart';
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
        {'name': 'The Commons', 'campus': 'Kennesaw Campus'},
        {
          'name': 'KSU Bookstore/Rec Center',
          'campus': 'Kennesaw Campus',
        },
        {
          'name': 'Marietta Student Center',
          'campus': 'Marietta Campus',
        },
      ],
    },
    'Kennesaw Loop Route': {
      'description': 'Circulates around Kennesaw Campus.',
      'hours': 'Mon–Thu: 7:00 AM–11:00 PM\n'
          'Friday: 7:00 AM–7:00 PM',
      'stops': [
        {
          'name': 'KSU Bookstore/Rec Center',
          'campus': 'Kennesaw Campus',
        },
        {'name': 'The Commons', 'campus': 'Kennesaw Campus'},
        {'name': 'North Residential', 'campus': 'Kennesaw Campus'},
        {'name': 'Marietta Drive', 'campus': 'Kennesaw Campus'},
      ],
    },
    'Marietta Loop Route': {
      'description': 'Circulates around Marietta Campus.',
      'hours': 'Monday–Friday: 7:30 AM–6:00 PM',
      'stops': [
        {
          'name': 'Shore Innovation Center',
          'campus': 'Marietta Campus',
        },
        {
          'name': 'University Courtyard',
          'campus': 'Marietta Campus',
        },
        {'name': 'Hornet Village', 'campus': 'Marietta Campus'},
        {'name': 'Shuttle Lot', 'campus': 'Marietta Campus'},
        {
          'name': 'University Columns',
          'campus': 'Marietta Campus',
        },
        {'name': 'Hornet Hub', 'campus': 'Marietta Campus'},
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
                  const SizedBox(height: 12),
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
