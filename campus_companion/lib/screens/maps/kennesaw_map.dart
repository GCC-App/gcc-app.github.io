
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class KennesawMap extends StatelessWidget {
  const KennesawMap({super.key});

  @override
  Widget build(BuildContext context) {
    final buildings = [
      {
        'name': 'Carmichael Student Center',
        'position': const LatLng(34.03849, -84.58309),
      },
      {
        'name': 'Kennesaw Hall',
        'position': const LatLng(34.03847, -84.58053),
      },
      {
        'name': 'Horace W. Sturgis Library',
        'position': const LatLng(34.03827, -84.58396),
      },
    ];

    final descriptions = {
      'Carmichael Student Center':
          'A central campus destination for student activities, '
              'gatherings, and services.',
      'Kennesaw Hall':
          'An academic building on the Kennesaw Campus.',
      'Horace W. Sturgis Library':
          'A campus library providing study spaces and learning resources.',
    };

    return FlutterMap(
      options: const MapOptions(
        initialCenter: LatLng(34.0385, -84.5825),
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
                  final buildingName =
                      building['name'] as String;

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
                                buildingName,
                                style: Theme.of(sheetContext)
                                    .textTheme
                                    .headlineSmall,
                              ),
                              const SizedBox(height: 12),
                              Text(
                                descriptions[buildingName] ??
                                    'Campus building information.',
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
