
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MariettaMap extends StatelessWidget {
  const MariettaMap({super.key});

  @override
  Widget build(BuildContext context) {
    final buildings = [
      {
        'name': 'Joe Mack Wilson Student Center',
        'position': const LatLng(33.9406, -84.5204),
        'description':
          'The hub of campus life, featuring student activities, '
          'services, meeting rooms, and event spaces.',
      },
      {
        'name': 'Lawrence V. Johnson Library',
        'position': const LatLng(33.93906, -84.52026),
        'description':
            'A campus library providing study spaces and '
            'learning resources.',
      },
      {
        'name': 'Engineering Technology Center',
        'position': const LatLng(33.93849, -84.52272),
        'description':
            'A campus facility supporting engineering '
            'technology education.',
      },
    ];

    return FlutterMap(
      options: const MapOptions(
        initialCenter: LatLng(33.9374, -84.5196),
        initialZoom: 17,
      ),
      children: [
        TileLayer(
          urlTemplate:
              'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.gccapp.campuscompanion',
        ),

        MarkerLayer(
          markers: buildings.map((building) {
            return Marker(
              point: building['position'] as LatLng,
              width: 50,
              height: 50,
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
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [
                              Text(
                                building['name'] as String,
                                style: Theme.of(sheetContext)
                                    .textTheme
                                    .headlineSmall,
                              ),
                              const SizedBox(height: 12),
                              Text(
                                building['description'] as String,
                                style: Theme.of(sheetContext)
                                    .textTheme
                                    .bodyLarge,
                              ),
                              const SizedBox(height: 20),
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
                child: const Icon(
                  Icons.location_on,
                  size: 40,
                  color: Colors.red,
                ),
              ),
            );
          }).toList(),
        ),

        RichAttributionWidget(
          attributions: [
            TextSourceAttribution(
              'OpenStreetMap contributors',
            ),
          ],
        ),
      ],
    );
  }
}
