import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';

class MealItemList extends StatelessWidget {
  const MealItemList({
    Key? key,
    required this.meals,
  }) : super(key: key);

  final List meals;

  @override
  Widget build(BuildContext context) {
    if (meals.isEmpty) {
      return Center(
        child: Text('No meals available'),
      );
    }

    return ListView.builder(
      itemBuilder: (_, index) {
        final meal = meals[index];
        return MealItem(
          id: meal.id,
          title: meal.title,
          imageUrl: meal.imageUrl,
          duration: meal.duration,
          complexity: meal.complexity,
          affordability: meal.affordability,
        );
      },
      itemCount: meals.length,
    );
  }
}
