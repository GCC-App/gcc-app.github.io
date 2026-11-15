import '../lib/services/nutrislice_service.dart';

Future<void> main() async {
  final service = NutrisliceService();

  try {
    final locations = await service.getDiningLocations();

    print('TOTAL LOCATIONS: ${locations.length}');

    for (final location in locations) {
      print('\n${location.name} (${location.campus})');

      for (final menu in location.menuTypes) {
        print('  ${menu.name} | ID: ${menu.id}');
      }
    }
  } catch (e) {
    print('ERROR: $e');
  }
}