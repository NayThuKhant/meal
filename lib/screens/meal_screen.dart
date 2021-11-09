import 'package:flutter/material.dart';

import '../widgets/meal_item_list.dart';

class MealScreen extends StatelessWidget {
  static const routeName = '/meals';
  final List availableMeals;

  MealScreen(this.availableMeals);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final meals = availableMeals
        .where((meal) => meal.categories.contains(categoryId))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: MealItemList(meals: meals),
    );
  }
}
