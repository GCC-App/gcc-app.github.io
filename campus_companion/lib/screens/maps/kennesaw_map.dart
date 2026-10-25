
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
            {
        'name': 'The Commons',
        'position': const LatLng(34.039872, -84.581788),
      },
      {
        'name': 'Student Recreation Center & Activites Center',
        'position': const LatLng(34.036866, -84.581879),
      },
      {
        'name': 'University Village Suites',
        'position': const LatLng(34.043263, -84.583097),
      },
      {
        'name': 'The Summit & Summit II',
        'position': const LatLng(34.034991, -84.583338),
      },
      
      {
        'name': 'Academic Learning Center',
        'position': const LatLng(34.039545, -84.583000),
      },
      {
        'name': 'Bagwell Education Building',
        'position': const LatLng(34.039374, -84.580886),
      },
      {
        'name': 'Burruss Building',
        'position': const LatLng(34.039385, -84.581801),
      },
      {
        'name': 'Convocation Center',
        'position': const LatLng(34.036973, -84.580398),
      },
      {
        'name': 'Clendenin Building',
        'position': const LatLng(34.035962, -84.583554),
      },
      {
        'name': 'English Building',
        'position': const LatLng(34.039409, -84.584073),
      },
      {
        'name': 'Prillaman Health Sciences Building',
        'position': const LatLng(34.040965, -84.582131),
      },
      {
        'name': 'Mathematics and Statistics Building',
        'position': const LatLng(34.037722, -84.584202),
      },
      {
        'name': 'Music Building',
        'position': const LatLng(34.040297, -84.582884),
      },
      {
        'name': 'Pilcher Public Service Building',
        'position': const LatLng(34.038242, -84.584293),
      },
      {
        'name': 'Science Building',
        'position': const LatLng(34.036011, -84.584341),
      },
      {
        'name': 'Science Laboratory Building',
        'position': const LatLng(34.035626, -84.584027),
      },
      {
        'name': 'Social Sciences Building',
        'position': const LatLng(34.038785, -84.585537),
      },
      {
        'name': 'University Hall',
        'position': const LatLng(34.038816, -84.584175),
      },
      {
        'name': 'Visual Arts Building',
        'position': const LatLng(34.040134, -84.585266),
      },
      {
        'name': 'Wilson Annex',
        'position': const LatLng(34.040325, -84.583786),
      },
      {
        'name': 'Wilson Building',
        'position': const LatLng(34.040218, -84.583373),
      },
      {
        'name': 'Willingham Hall',
        'position': const LatLng(34.038838, -84.584700),
      },
      {
        'name': 'Bailey Performance Center',
        'position': const LatLng(34.040843, -84.583778),
      },
      {
        'name': 'Bobbie Bailey Athletic Complex',
        'position': const LatLng(34.034404, -84.581970),
      },
      {
        'name': 'Fifth Third Bank Stadium',
        'position': const LatLng(34.028829, -84.567668),
      },
      {
        'name': 'Owl’s Nest',
        'position': const LatLng(34.030176, -84.570007),
      },
      {
        'name': 'The Perch',
        'position': const LatLng(34.030914, -84.562830),
      },
      {
        'name': 'KSU Center',
        'position': const LatLng(34.031074, -84.574159),
      },
      {
        'name': 'Town Point',
        'position': const LatLng(34.030078, -84.581391),
      },
      
      // Dining
      {
        'name': 'The Market (Student Center)',
        'position': const LatLng(34.037882, -84.583174),
      },
      {
        'name': 'The Market (University Village)',
        'position': const LatLng(34.042599, -84.582670),
      },
      {
        'name': 'Chick-fil-A',
        'position': const LatLng(34.038225, -84.583029),
      },
      {
        'name': 'Cinnabon',
        'position': const LatLng(34.039591, -84.583161),
      },
      {
        'name': 'High Point Café',
        'position': const LatLng(34.034690, -84.583488),
      },
      {
        'name': 'Jamba',
        'position': const LatLng(34.038320, -84.583295),
      },
      {
        'name': 'McAlister’s Deli',
        'position': const LatLng(34.039385, -84.581691),
      },
      {
        'name': 'Moe’s Southwest Grill',
        'position': const LatLng(34.038167, -84.583306),
      },
      {
        'name': 'Panda Express',
        'position': const LatLng(34.038420, -84.583172),
      },
      {
        'name': 'Starbucks - Social Sciences',
        'position': const LatLng(34.038969, -84.585323),
      },
      {
        'name': 'Talon Express',
        'position': const LatLng(34.038582, -84.582954),
      },

      // Student services and administration
      {
        'name': 'Campus Services',
        'position': const LatLng(34.031765, -84.584985),
      },
      {
        'name': 'Digital Learning Innovation',
        'position': const LatLng(34.031505, -84.584773),
      },
      {
        'name': 'Public Safety',
        'position': const LatLng(34.037862, -84.585250),
      },
      {
        'name': 'Talon One Service Center',
        'position': const LatLng(34.037989, -84.583150),
      },
      {
        'name': 'Technology Services',
        'position': const LatLng(34.043139, -84.584864),
      },
      {
        'name': 'University Information Technology Services',
        'position': const LatLng(34.037687, -84.584722),
      },
      {
        'name': 'Health Clinic',
        'position': const LatLng(34.033175, -84.585854),
      },

      // Parking
      {
        'name': 'Central Deck',
        'position': const LatLng(34.041621, -84.581527),
      },
      {
        'name': 'East Deck',
        'position': const LatLng(34.036002, -84.580873),
      },
      {
        'name': 'North Deck',
        'position': const LatLng(34.043783, -84.584754),
      },
      {
        'name': 'West Deck',
        'position': const LatLng(34.037836, -84.585985),
      },
      {
        'name': 'East Economy Parking',
        'position': const LatLng(34.034901, -84.579609),
      },
      {
        'name': 'West Economy Parking',
        'position': const LatLng(34.035262, -84.586524),
      },
      {
        'name': 'Town Point Economy Parking',
        'position': const LatLng(34.029185, -84.581246),
      },
      {
        'name': 'Shuttle Lot',
        'position': const LatLng(34.029305, -84.573773),
      },
      {
        'name': 'Visitor Parking - Central',
        'position': const LatLng(34.037089, -84.583016),
      },
      
      {
        'name': 'KSU Place',
        'position': const LatLng(34.044828, -84.584180),
      },
      {
        'name': 'Austin Residence Complex',
        'position': const LatLng(34.032550, -84.583204),
      },
      {
        'name': 'Zuckerman Museum of Art',
        'position': const LatLng(34.040989, -84.583394),
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
            'The Commons':
          'A campus dining destination for students.',
      'Student Recreation Center & Activites Center':
          'A campus recreation destination for fitness and activities.',
      'University Village Suites':
          'A residential area on the Kennesaw Campus.',
      'The Summit & Summit II':
          'A residential complex on the Kennesaw Campus.',
      'Academic Learning Center':
          'Academic classrooms and learning facilities.',
      'Bagwell Education Building':
          'Facilities supporting education programs.',
      'Burruss Building':
          'Academic classrooms and university offices.',
      'Convocation Center':
          'Campus classrooms and event facilities.',
      'Clendenin Building':
          'Academic classrooms and campus facilities.',
      'English Building':
          'Facilities supporting English studies.',
      'Prillaman Health Sciences Building':
          'Academic facilities for health sciences.',
      'Mathematics and Statistics Building':
          'Facilities supporting mathematics and statistics programs.',
      'Music Building':
          'Music instruction and related academic facilities.',
      'Pilcher Public Service Building':
          'Academic and public service facilities.',
      'Science Building':
          'Science classrooms and academic facilities.',
      'Science Laboratory Building':
          'Laboratory and science learning facilities.',
      'Social Sciences Building':
          'Facilities supporting social science programs.',
      'University Hall':
          'Academic classrooms and university facilities.',
      'Visual Arts Building':
          'Facilities for visual and commercial arts.',
      'Wilson Annex':
          'Academic and university facilities.',
      'Wilson Building':
          'Campus building containing Stillwell Theater.',
      'Willingham Hall':
          'Academic classrooms and university facilities.',
      'Bailey Performance Center':
          'A venue for performances and campus events.',
      'Bobbie Bailey Athletic Complex':
          'Athletic facilities and sports fields.',
      'Fifth Third Bank Stadium':
          'Stadium for university athletics and events.',
      'Owl’s Nest':
          'A campus destination for student activities.',
      'The Perch':
          'Campus recreation and athletic facilities.',
      'KSU Center':
          'University facilities for professional and continuing education.',
      'Town Point':
          'Campus facilities and university services.',
      
      'The Market (Student Center)': 'Campus convenience store and dining location.',
      'The Market (University Village)': 'Campus convenience store and dining location.',
      'Chick-fil-A': 'Quick-service dining on campus.',
      'Cinnabon': 'Bakery and cinnamon-roll dining location.',
      'High Point Café': 'Campus café near the residential area.',
      'Jamba': 'Smoothies and quick refreshments.',
      'McAlister’s Deli': 'Deli-style sandwiches and meals.',
      'Moe’s Southwest Grill': 'Southwestern-style quick-service dining.',
      'Panda Express': 'Chinese-American quick-service dining.',
      'Starbucks - Social Sciences':
          'Coffee shop in the Social Sciences Building.',
      'Talon Express': 'Convenience and grab-and-go campus location.',
      'Campus Services': 'Campus operational and support services.',
      'Digital Learning Innovation':
          'University support for digital learning.',
      'Public Safety': 'Campus public safety services.',
      'Talon One Service Center':
          'Student service assistance and university support.',
      'Technology Services': 'University technology support.',
      'University Information Technology Services':
          'University IT systems and technical services.',
      'Health Clinic': 'Campus health services.',
      'Central Deck': 'Central campus parking deck.',
      'East Deck': 'East campus parking deck.',
      'North Deck': 'North campus parking deck.',
      'West Deck': 'West campus parking deck.',
      'East Economy Parking': 'Economy parking on the east side of campus.',
      'West Economy Parking': 'Economy parking on the west side of campus.',
      'Town Point Economy Parking': 'Economy parking near Town Point.',
      'Shuttle Lot': 'Campus shuttle parking and access area.',
      'Visitor Parking - Central': 'Visitor parking near the central campus.',
      'KSU Place':
          'An upper-class student housing community on the northern side of the Kennesaw Campus.',
      'Austin Residence Complex':
          'A student apartment community on the south side of the Kennesaw Campus, with furnished apartments and shared amenities.',
      'Zuckerman Museum of Art':
    'A university art museum featuring exhibitions of contemporary art and visual culture.',
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
