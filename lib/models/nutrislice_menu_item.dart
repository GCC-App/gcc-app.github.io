class NutrisliceMenuItem {
  final String name;
  final String description;
  final List<String> dietaryLabels;
  final bool isSectionTitle;

  const NutrisliceMenuItem({
    required this.name,
    this.description = '',
    this.dietaryLabels = const [],
    this.isSectionTitle = false,
  });

  factory NutrisliceMenuItem.fromJson(Map<String, dynamic> json) {
    if (json['is_section_title'] == true) {
      return NutrisliceMenuItem(
        name: json['text']?.toString() ?? '',
        isSectionTitle: true,
      );
    }

    final food = json['food'] as Map<String, dynamic>?;

    if (food == null) {
      return const NutrisliceMenuItem(name: '');
    }

    final icons = food['icons']?['food_icons'] as List? ?? [];

    return NutrisliceMenuItem(
      name: food['name']?.toString() ?? '',
      description: food['description']?.toString() ?? '',
      dietaryLabels: icons
          .where((icon) => icon['enabled'] == true)
          .map((icon) => icon['name'].toString())
          .toList(),
    );
  }
}