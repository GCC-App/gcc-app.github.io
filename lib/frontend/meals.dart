import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/nutrislice_location.dart';
import '../models/nutrislice_menu_item.dart';
import '../services/nutrislice_service.dart';

class MealsScreen extends StatefulWidget {
  const MealsScreen({super.key});

  @override
  State<MealsScreen> createState() => _MealsScreenState();
}

class _MealsScreenState extends State<MealsScreen> {
  final NutrisliceService service = NutrisliceService();

  static const String nutrisliceUrl =
      'https://ksu.nutrislice.com/menu';

  String selectedCampus = 'Kennesaw';

  NutrisliceLocation? selectedLocation;
  NutrisliceMenuType? selectedMenuType;

  DateTime selectedDate = DateTime.now();

  List<NutrisliceLocation> allLocations = [];
  List<NutrisliceMenuItem> menuItems = [];

  Set<String> selectedFilters = {};

  bool isLoadingLocations = true;
  bool isLoadingMenu = false;

  String? locationError;
  String? menuError;

  @override
  void initState() {
    super.initState();
  }

  // ------------------------------------------------------------
  // LOAD DINING LOCATIONS
  // ------------------------------------------------------------

  Future<void> _loadLocations() async {
    try {
      final locations = await service.getDiningLocations();

      if (!mounted) return;

      setState(() {
        allLocations = locations;
        isLoadingLocations = false;
      });
    } catch (e) {
      if (!mounted) return;

      setState(() {
        isLoadingLocations = false;
        locationError = e.toString();
      });
    }
  }

  // ------------------------------------------------------------
  // FILTER LOCATIONS BY CAMPUS
  // ------------------------------------------------------------

  List<NutrisliceLocation> get campusLocations {
    return allLocations.where((location) {
      return location.campus == selectedCampus ||
          location.campus == 'Both';
    }).toList();
  }

  // ------------------------------------------------------------
  // SELECT A LOCATION
  // ------------------------------------------------------------

  void _selectLocation(NutrisliceLocation? location) {
    setState(() {
      selectedLocation = location;
      selectedMenuType = null;
      menuItems = [];
      selectedFilters.clear();
      menuError = null;
    });
  }

  // ------------------------------------------------------------
  // LOAD SELECTED MENU
  // ------------------------------------------------------------

  Future<void> _loadMenu() async {
    if (selectedLocation == null || selectedMenuType == null) {
      return;
    }

    setState(() {
      isLoadingMenu = true;
      menuError = null;
      menuItems = [];
      selectedFilters.clear();
    });

    try {
      final items = await service.fetchMenuItems(
        locationId: selectedLocation!.id,
        menuTypeId: selectedMenuType!.id,
        date: selectedDate,
      );

      if (!mounted) return;

      setState(() {
        menuItems = items;
        isLoadingMenu = false;
      });
    } catch (e) {
      if (!mounted) return;

      setState(() {
        isLoadingMenu = false;
        menuError = e.toString();
      });
    }
  }

  // ------------------------------------------------------------
  // SELECT A MENU STATION
  // ------------------------------------------------------------

  void _selectMenuType(NutrisliceMenuType? menuType) {
    setState(() {
      selectedMenuType = menuType;
      menuItems = [];
      selectedFilters.clear();
      menuError = null;
    });

    if (menuType != null) {
      _loadMenu();
    }
  }

  // ------------------------------------------------------------
  // SELECT A DATE
  // ------------------------------------------------------------

  void _selectDate(DateTime date) {
    setState(() {
      selectedDate = date;
    });

    if (selectedMenuType != null) {
      _loadMenu();
    }
  }

  // ------------------------------------------------------------
  // AVAILABLE FILTERS
  // Only use labels actually returned by Nutrislice.
  // ------------------------------------------------------------

  List<String> get availableFilters {
    final labels = <String>{};

    for (final item in menuItems) {
      if (!item.isSectionTitle) {
        labels.addAll(item.dietaryLabels);
      }
    }

    final result = labels.toList()..sort();
    return result;
  }

  // ------------------------------------------------------------
  // FILTER MENU ITEMS WHILE PRESERVING STATION HEADINGS
  // ------------------------------------------------------------

  List<NutrisliceMenuItem> get filteredMenu {
    if (selectedFilters.isEmpty) {
      return menuItems;
    }

    final result = <NutrisliceMenuItem>[];
    NutrisliceMenuItem? currentHeading;
    final matchingItems = <NutrisliceMenuItem>[];

    void addSection() {
      if (matchingItems.isNotEmpty) {
        if (currentHeading != null) {
          result.add(currentHeading);
        }

        result.addAll(matchingItems);
      }

      matchingItems.clear();
    }

    for (final item in menuItems) {
      if (item.isSectionTitle) {
        addSection();
        currentHeading = item;
      } else {
        final matches = selectedFilters.every(
          (filter) => item.dietaryLabels.any(
            (label) => label.toLowerCase() == filter.toLowerCase(),
          ),
        );

        if (matches) {
          matchingItems.add(item);
        }
      }
    }

    addSection();

    return result;
  }

  // ------------------------------------------------------------
  // OPEN OFFICIAL NUTRISLICE WEBSITE
  // ------------------------------------------------------------

  Future<void> _openNutrislice() async {
    final uri = Uri.parse(nutrisliceUrl);

    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Could not open the Nutrislice website.'),
        ),
      );
    }
  }

  // ------------------------------------------------------------
  // DATE HELPERS
  // ------------------------------------------------------------

  DateTime get today {
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day);
  }

  String _dateLabel(DateTime date) {
    return '${date.month}/${date.day}';
  }

  // ------------------------------------------------------------
  // BUILD SCREEN
  // ------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    final locations = campusLocations;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dining & Meals'),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            // CAMPUS SELECTION

            const Text(
              'Select Campus',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              'Campus selection temporarily disabled',
              style: TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 20),

            // DINING LOCATION

            const Text(
              'Select Dining Location',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            if (isLoadingLocations)
              const LinearProgressIndicator()
            else if (locationError != null)
              Text(
                'Unable to load dining locations: $locationError',
                style: const TextStyle(color: Colors.red),
              )
            else
              DropdownButtonFormField<NutrisliceLocation>(
                initialValue: selectedLocation,
                isExpanded: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Choose a dining location',
                ),
                items: locations.map((location) {
                  return DropdownMenuItem(
                    value: location,
                    child: Text(
                      location.name,
                      overflow: TextOverflow.ellipsis,
                    ),
                  );
                }).toList(),
                onChanged: _selectLocation,
              ),

            const SizedBox(height: 20),

            // MENU STATION

            const Text(
              'Select Menu Station',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            DropdownButtonFormField<NutrisliceMenuType>(
              initialValue: selectedMenuType,
              isExpanded: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Choose a menu station',
              ),
              items: (selectedLocation?.menuTypes ?? [])
                  .map((menu) {
                return DropdownMenuItem(
                  value: menu,
                  child: Text(
                    menu.name,
                    overflow: TextOverflow.ellipsis,
                  ),
                );
              }).toList(),
              onChanged: selectedLocation == null
                  ? null
                  : _selectMenuType,
            ),

            const SizedBox(height: 20),

            // DATE SELECTION

            const Text(
              'Select Date',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Row(
              children: List.generate(3, (index) {
                final date = today.add(Duration(days: index));

                final isSelected =
                    selectedDate.year == date.year &&
                    selectedDate.month == date.month &&
                    selectedDate.day == date.day;

                final labels = [
                  'Today',
                  'Tomorrow',
                  'Day After',
                ];

                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 4,
                    ),
                    child: ChoiceChip(
                      label: Column(
                        children: [
                          Text(labels[index]),
                          Text(
                            _dateLabel(date),
                            style: const TextStyle(fontSize: 11),
                          ),
                        ],
                      ),
                      selected: isSelected,
                      onSelected: (_) => _selectDate(date),
                    ),
                  ),
                );
              }),
            ),

            const SizedBox(height: 15),

            // DIETARY FILTERS

            if (availableFilters.isNotEmpty)
              ExpansionTile(
                leading: const Icon(Icons.filter_list),
                title: const Text(
                  'Dietary & Allergen Labels',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  selectedFilters.isEmpty
                      ? 'No filters selected'
                      : '${selectedFilters.length} filter(s) selected',
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: availableFilters.map((filter) {
                        return FilterChip(
                          label: Text(filter),
                          selected: selectedFilters.contains(filter),
                          onSelected: (selected) {
                            setState(() {
                              if (selected) {
                                selectedFilters.add(filter);
                              } else {
                                selectedFilters.remove(filter);
                              }
                            });
                          },
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),

            const SizedBox(height: 10),

            // MENU DISPLAY

            const Text(
              'Menu',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Expanded(
              child: Builder(
                builder: (context) {

                  if (selectedLocation == null) {
                    return const Center(
                      child: Text(
                        'Select a dining location to begin.',
                        textAlign: TextAlign.center,
                      ),
                    );
                  }

                  if (selectedMenuType == null) {
                    return const Center(
                      child: Text(
                        'Select a menu station to view its menu.',
                        textAlign: TextAlign.center,
                      ),
                    );
                  }

                  if (isLoadingMenu) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (menuError != null) {
                    return Center(
                      child: Text(
                        'Unable to load menu:\n$menuError',
                        textAlign: TextAlign.center,
                      ),
                    );
                  }

                  if (filteredMenu.isEmpty) {
                    return const Center(
                      child: Text(
                        'No menu items are available for this date '
                        'or the selected filters.',
                        textAlign: TextAlign.center,
                      ),
                    );
                  }

                  return ListView(
                    children: [

                      Text(
                        '${selectedLocation!.name} - '
                        '${selectedMenuType!.name}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      const SizedBox(height: 5),

                      Text(
                        _dateLabel(selectedDate),
                        style: TextStyle(
                          color: Colors.grey.shade600,
                        ),
                      ),

                      const SizedBox(height: 12),

                      ...filteredMenu.map((item) {

                        // STATION HEADING

                        if (item.isSectionTitle) {
                          return Padding(
                            padding: const EdgeInsets.only(
                              top: 16,
                              bottom: 8,
                            ),
                            child: Text(
                              item.name,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
                        }

                        // FOOD CARD

                        return Card(
                          child: Padding(
                            padding: const EdgeInsets.all(12),

                            child: Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,

                              children: [

                                ListTile(
                                  contentPadding: EdgeInsets.zero,
                                  leading: const Icon(
                                    Icons.restaurant,
                                  ),
                                  title: Text(
                                    item.name,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),

                                if (item.description.isNotEmpty)
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      bottom: 8,
                                    ),
                                    child: Text(item.description),
                                  ),

                                if (item.dietaryLabels.isNotEmpty)
                                  Wrap(
                                    spacing: 6,
                                    runSpacing: 6,
                                    children: item.dietaryLabels.map(
                                      (label) {
                                        return Chip(
                                          label: Text(label),
                                          visualDensity:
                                              VisualDensity.compact,
                                        );
                                      },
                                    ).toList(),
                                  ),

                                if (item.dietaryLabels.isEmpty)
                                  Text(
                                    'No dietary or allergen labels provided.',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey.shade600,
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        );
                      }),
                    ],
                  );
                },
              ),
            ),

            // OFFICIAL NUTRISLICE BUTTON

            const SizedBox(height: 10),

            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: _openNutrislice,
                icon: const Icon(Icons.open_in_new),
                label: const Text(
                  'Open Official KSU Dining Menus',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}