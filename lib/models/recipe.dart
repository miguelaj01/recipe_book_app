class Recipe {
  final String name;
  final String imagePath;
  final String description;
  final List<String> ingredients;
  final List<String> instructions;
  final int cookTimeMinutes;
  final String difficulty;

  const Recipe({
    required this.name,
    required this.imagePath,
    required this.description,
    required this.ingredients,
    required this.instructions,
    required this.cookTimeMinutes,
    required this.difficulty,
  });
}
