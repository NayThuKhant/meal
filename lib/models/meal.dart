enum Complexity {
  Simple,
  Challenging,
  Hard,
}

enum Affordability {
  Affordable,
  Pricey,
  Luxurious,
}

class Meal {
  final String id;
  final String title;
  final String imageUrl;
  String duration = '';

  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;

  final Complexity complexity;
  final Affordability affordability;

  final List<String> steps;
  final List<String> categories;
  final List<String> ingredients;

  Meal({
    required this.id,
    required this.title,
    required this.imageUrl,
    required duration,
    required this.isGlutenFree,
    required this.isLactoseFree,
    required this.isVegan,
    required this.isVegetarian,
    required this.complexity,
    required this.affordability,
    required this.steps,
    required this.categories,
    required this.ingredients,
  }) {
    this.duration = '$duration mins';
  }
}

String convertComplexityToText(Complexity complexity) {
  var value = null;
  switch (complexity) {
    case Complexity.Simple:
      value = 'Simple';
      break;

    case Complexity.Challenging:
      value = 'Challenging';
      break;

    case Complexity.Hard:
      value = 'Hard';
      break;
  }
  return value;
}

String convertAffordabilityToText(Affordability affordability) {
  var value = null;
  switch (affordability) {
    case Affordability.Affordable:
      value = 'Affordable';
      break;

    case Affordability.Pricey:
      value = 'Pricey';
      break;

    case Affordability.Luxurious:
      value = 'Expensive';
      break;
  }
  return value;
}
