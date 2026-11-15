class NutrisliceLocation {
  final String name;
  final int id;
  final String slug;
  final String campus;
  final List<NutrisliceMenuType> menuTypes;

  const NutrisliceLocation({
    required this.name,
    required this.id,
    required this.slug,
    required this.campus,
    required this.menuTypes,
  });
}

class NutrisliceMenuType {
  final String name;
  final String slug;
  final int id;

  const NutrisliceMenuType({
    required this.name,
    required this.slug,
    required this.id,
  });
}