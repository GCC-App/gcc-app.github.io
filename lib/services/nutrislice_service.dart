import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/nutrislice_menu_item.dart';
import '../models/nutrislice_location.dart';

class NutrisliceService {
  static const String baseUrl =
    'https://campus-companion-nutrislice.asteratedofficial.workers.dev';

  /// Retrieves all available KSU dining locations.
  Future<List<dynamic>> fetchDiningLocations() async {
    final url = Uri.parse('$baseUrl/menu/api/schools');

    final response = await http.get(url);

    if (response.statusCode != 200) {
      throw Exception(
        'Failed to load dining locations: ${response.statusCode}',
      );
    }

    final data = jsonDecode(response.body);

    if (data is! List) {
      throw Exception('Unexpected dining locations response.');
    }

    return data;
  }

  /// Retrieves a weekly menu for a dining location.
  Future<List<dynamic>> fetchWeeklyMenu({
    required String locationSlug,
    required String menuTypeSlug,
    required DateTime date,
  }) async {
    final url = Uri.parse(
      '$baseUrl/menu/api/weeks/digest/school/'
      '$locationSlug/menu-type/$menuTypeSlug/'
      'date/${date.year}/${date.month}/${date.day}',
    );

    final response = await http.get(
      url,
      headers: {
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 204) {
      return [];
    }

    if (response.statusCode != 200) {
      throw Exception(
        'Failed to load weekly menu: ${response.statusCode}',
      );
    }

    final data = jsonDecode(response.body);

    if (data is! List) {
      throw Exception('Unexpected weekly menu response.');
    }

    return data;
  }

  Future<dynamic> fetchFullMenu({
    required int locationId,
    required int menuTypeId,
    required DateTime date,
  }) async {
    final url = Uri.parse(
      '$baseUrl/menu/api/weeks/school/'
      '$locationId/menu-type/$menuTypeId/'
      '${date.year}/${date.month}/${date.day}',
    );

    final response = await http.get(
      url,
      headers: {'Accept': 'application/json'},
    );

    if (response.statusCode == 204) return null;

    if (response.statusCode != 200) {
      throw Exception(
        'Failed to load full menu: ${response.statusCode}',
      );
    }

    return jsonDecode(response.body);
  }

  Future<List<NutrisliceMenuItem>> fetchMenuItems({
    required int locationId,
    required int menuTypeId,
    required DateTime date,
  }) async {
    final response = await fetchFullMenu(
      locationId: locationId,
      menuTypeId: menuTypeId,
      date: date,
    );

    if (response is! Map) {
      return [];
    }

    final days = response['days'] as List? ?? [];

    final formattedDate =
        '${date.year}-'
        '${date.month.toString().padLeft(2, '0')}-'
        '${date.day.toString().padLeft(2, '0')}';

    final matchingDay = days.cast<Map>().where(
      (day) => day['date'] == formattedDate,
    );

    if (matchingDay.isEmpty) {
      return [];
    }

    final menuEntries =
        matchingDay.first['menu_items'] as List? ?? [];

    return menuEntries
        .where((item) =>
            item['is_section_title'] == true ||
            item['food'] != null)
        .map((item) => NutrisliceMenuItem.fromJson(
              Map<String, dynamic>.from(item),
            ))
        .toList();
  }

  Future<List<NutrisliceLocation>> getDiningLocations() async {
    final data = await fetchDiningLocations();

    final locations = <NutrisliceLocation>[];

    for (final item in data) {
      final id = item['id'];
      final name = item['name']?.toString() ?? '';
      final slug = item['slug']?.toString() ?? '';

      if (id == null || name.isEmpty || slug.isEmpty) {
        continue;
      }

      final categoryIds =
          (item['display_category_ids'] as List? ?? [])
              .map((value) => value.toString())
              .toSet();

      String? campus;

      if (name == 'Chick-fil-A') {
        campus = null; // Available on both campuses.
      } else if (categoryIds.contains('6786')) {
        campus = 'Kennesaw';
      } else if (categoryIds.contains('6787')) {
        campus = 'Marietta';
      }

      if (campus == null && name != 'Chick-fil-A') {
        continue;
      }

      final menuTypes = <NutrisliceMenuType>[];

      for (final menu in item['active_menu_types'] ?? []) {
        menuTypes.add(
          NutrisliceMenuType(
            name: menu['name']?.toString() ?? '',
            slug: menu['slug']?.toString() ?? '',
            id: int.tryParse(menu['id'].toString()) ?? 0,
          ),
        );
      }

      locations.add(
        NutrisliceLocation(
          name: name,
          id: int.parse(id.toString()),
          slug: slug,
          campus: campus ?? 'Both',
          menuTypes: menuTypes,
        ),
      );
    }

    return locations;
  }
}