
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
      },
      {
        'name': 'Lawrence V. Johnson Library',
        'position': const LatLng(33.93906, -84.52026),
      },
      {
        'name': 'Engineering Technology Center',
        'position': const LatLng(33.93849, -84.52272),
      },
      {
        'name': 'Atrium Building',
        'position': const LatLng(33.937755, -84.520199),
      },
      {
        'name': 'Architecture Building',
        'position': const LatLng(33.936306, -84.518911),
      },
      {
        'name': 'Design II Building',
        'position': const LatLng(33.937788, -84.5212532),
      },
      {
        'name': 'W. Clair Harris Textile Center',
        'position': const LatLng(33.936698, -84.519861),
      },
      {
        'name': 'Norton Hall',
        'position': const LatLng(33.939032, -84.519236),
      },
      {
        'name': 'Academic Building',
        'position': const LatLng(33.938338, -84.520550),
      },
      {
        'name': 'Design Building I',
        'position': const LatLng(33.938031, -84.521277),
      },
      {
        'name': 'Shore Center',
        'position': const LatLng(33.940027, -84.519029),
      },
      {
        'name': 'Hornet Hub',
        'position': const LatLng(33.938905, -84.523112),
      },
      {
        'name': 'Hornet Village',
        'position': const LatLng(33.936662, -84.521760),
      },
      {
        'name': 'University Columns',
        'position': const LatLng(33.935387, -84.524898),
      },
      {
        'name': 'Recreation and Wellness Center',
        'position': const LatLng(33.941186, -84.517602),
      },
      {
        'name': 'Marietta Campus Bookstore',
        'position': const LatLng(33.940463, -84.520167),
      },
      {
        'name': 'Marietta Campus Health Clinic',
        'position': const LatLng(33.939232, -84.516224),
      },
      
      {
        'name': 'Howell Hall',
        'position': const LatLng(33.938157, -84.518930),
      },
      {
        'name': 'University Commons',
        'position': const LatLng(33.937236, -84.517283),
      },
      {
        'name': 'University Courtyard',
        'position': const LatLng(33.939099, -84.516889),
      },
      {
        'name': 'University Columns Activity Center',
        'position': const LatLng(33.934239, -84.525606),
      },
      {
        'name': 'Housing and Residence Life Office',
        'position': const LatLng(33.938393, -84.518101),
      },
      {
        'name': 'Gymnasium',
        'position': const LatLng(33.935814, -84.518353),
      },
      {
        'name': 'S. Walter Kelly, Sr. Memorial Field',
        'position': const LatLng(33.934753, -84.518705),
      },
      {
        'name': 'Student Competition Team Building',
        'position': const LatLng(33.935167, -84.520810),
      },
      {
        'name': 'Wilder Communications Center',
        'position': const LatLng(33.934488, -84.520942),
      },
      
      {
        'name': 'Stingers Dining Hall',
        'position': const LatLng(33.937371, -84.522293),
      },
      {
        'name': 'Chick-fil-A',
        'position': const LatLng(33.940614, -84.520470),
      },
      {
        'name': 'Dunkin',
        'position': const LatLng(33.940432, -84.520451),
      },
      {
        'name': 'STACKS',
        'position': const LatLng(33.937519, -84.520046),
      },
      // Parking
      {
        'name': 'Central Parking',
        'position': const LatLng(33.941384, -84.520580),
      },
      {
        'name': 'East Parking',
        'position': const LatLng(33.940376, -84.517803),
      },
      {
        'name': 'East Economy Parking',
        'position': const LatLng(33.935055, -84.514665),
      },
      {
        'name': 'West Parking',
        'position': const LatLng(33.934997, -84.520102),
      },
      {
        'name': 'Shuttle Lot',
        'position': const LatLng(33.936555, -84.526877),
      },
      {
        'name': 'Visitor Parking',
        'position': const LatLng(33.940777, -84.519652),
      },
      {
        'name': 'West Deck',
        'position': const LatLng(33.937817, -84.522744),
      },
      {
        'name': 'East Residence Lot',
        'position': const LatLng(33.938233, -84.516529),
      },
      {
        'name': 'West Residence Lot',
        'position': const LatLng(33.936974, -84.522699),
      },
      // Campus services and facilities
      {
        'name': 'Administration Building',
        'position': const LatLng(33.939715, -84.519772),
      },
      {
        'name': 'Talon One Service Center',
        'position': const LatLng(33.940777, -84.520598),
      },
      {
        'name': 'Facilities Administration',
        'position': const LatLng(33.936531, -84.515159),
      },
      {
        'name': 'Central Receiving',
        'position': const LatLng(33.934875, -84.514010),
      },
      {
        'name': 'Facilities Grounds and Vehicle Shop',
        'position': const LatLng(33.935845, -84.514730),
      },
      {
        'name': 'Facilities Grounds and Storage',
        'position': const LatLng(33.936553, -84.527816),
      },
      {
        'name': 'Facilities Maintenance Shop',
        'position': const LatLng(33.935496, -84.514349),
      },
      {
        'name': 'Facilities Small Vehicle Storage',
        'position': const LatLng(33.936097, -84.514861),
      },
      {
        'name': 'Facilities Large Vehicle Storage',
        'position': const LatLng(33.935302, -84.514569),
      },
      {
        'name': 'Civil and Environmental Engineering',
        'position': const LatLng(33.935685, -84.520349),
      },
      {
        'name': 'Crawford Lab Building',
        'position': const LatLng(33.939114, -84.521623),
      },
      {
        'name': 'Engineering Lab Building',
        'position': const LatLng(33.938458, -84.521282),
      },
      {
        'name': 'Mathematics Building',
        'position': const LatLng(33.939875, -84.520824),
      },
      {
        'name': 'Science Lab Annex',
        'position': const LatLng(33.938698, -84.521695),
      },
      {
        'name': 'Dance Theater',
        'position': const LatLng(33.940387, -84.520735),
      },
    ];

    final descriptions = {
      'Joe Mack Wilson Student Center':
          'The hub of campus life, featuring student activities, '
              'services, meeting rooms, and event spaces.',
      'Lawrence V. Johnson Library':
          'A campus library providing study spaces and '
              'learning resources.',
      'Engineering Technology Center':
          'A campus facility supporting engineering '
              'technology education.',
      'Atrium Building':
          'Campus academic and student facilities.',
      'Architecture Building':
          'Academic facilities supporting architecture programs.',
      'Design II Building':
          'Facilities for design education and related programs.',
      'W. Clair Harris Textile Center':
          'Academic and laboratory facilities for textile engineering.',
      'Norton Hall':
          'Academic classrooms and university facilities.',
      'Academic Building':
          'Academic classrooms and learning facilities.',
      'Design Building I':
          'Academic and campus facilities.',
      'Shore Center':
          'Campus facility providing student services and amenities.',
      'Hornet Hub':
          'A campus destination for student activities and services.',
      'Hornet Village':
          'A student residential community on the Marietta Campus.',
      'University Columns':
          'Student residential community on the Marietta Campus.',
      'Recreation and Wellness Center':
          'Campus recreation, fitness, and wellness facilities.',
      'Marietta Campus Bookstore':
          'Campus bookstore for course materials and KSU merchandise.',
      'Marietta Campus Health Clinic':
          'Health services for students on the Marietta Campus.',
      'Howell Hall':
          'Student residence hall on the Marietta Campus.',
      'University Commons':
          'Student housing community on the Marietta Campus.',
      'University Courtyard':
          'Student residential community on the Marietta Campus.',
      'University Columns Activity Center':
          'Activity facilities serving the University Columns community.',
      'Housing and Residence Life Office':
          'Housing information and residential student support.',
      'Gymnasium':
          'Indoor athletic and event facilities.',
      'S. Walter Kelly, Sr. Memorial Field':
          'Outdoor athletic field on the Marietta Campus.',
      'Student Competition Team Building':
          'Facilities supporting student engineering competition teams.',
      'Wilder Communications Center':
          'Campus building supporting communications-related programs.',
      'Stingers Dining Hall':
          'The main dining hall on the Marietta Campus, offering a variety of meals.',
      'Chick-fil-A':
          'Quick-service dining inside the Joe Mack Wilson Student Center.',
      'Dunkin':
          'Coffee, beverages, and quick breakfast options in the Joe Mack Wilson Student Center.',
      'STACKS':
          'A campus dining location in the Atrium Building.',
      // Parking
      'Central Parking':
          'Central parking areas on the Marietta Campus.',
      'East Parking':
          'East-side campus parking areas.',
      'East Economy Parking':
          'Economy parking areas on the east side of campus.',
      'West Parking':
          'West-side campus parking areas.',
      'Shuttle Lot':
          'Parking area serving campus shuttle transportation.',
      'Visitor Parking':
          'Designated parking areas for campus visitors.',
      'West Deck':
          'Parking deck on the Marietta Campus.',
      'East Residence Lot':
          'Parking area serving campus residences on the east side.',
      'West Residence Lot':
          'Parking area serving campus residences on the west side.',
      // Campus services and facilities
      'Administration Building':
          'Administrative offices and university support services.',
      'Talon One Service Center':
          'Student service assistance and university support.',
      'Facilities Administration':
          'Administrative offices for campus facilities operations.',
      'Central Receiving':
          'Campus receiving and distribution facility.',
      'Facilities Grounds and Vehicle Shop':
          'Campus grounds maintenance and vehicle services.',
      'Facilities Grounds and Storage':
          'Storage supporting campus facilities operations.',
      'Facilities Maintenance Shop':
          'Maintenance facilities supporting campus operations.',
      'Facilities Small Vehicle Storage':
          'Storage for campus service vehicles.',
      'Facilities Large Vehicle Storage':
          'Storage for campus service vehicles.',
      'Civil and Environmental Engineering':
          'Academic facilities for civil and environmental engineering.',
      'Crawford Lab Building':
          'Laboratory and academic facilities.',
      'Engineering Lab Building':
          'Engineering laboratories and instructional facilities.',
      'Mathematics Building':
          'Academic facilities supporting mathematics education.',
      'Science Lab Annex':
          'Laboratory facilities supporting science and engineering programs.',
      'Dance Theater':
          'A performance and instructional space for dance and related activities.',
    };

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
