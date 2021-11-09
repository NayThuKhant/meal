import 'package:flutter/material.dart';
import 'package:meal/widgets/meal_item_list.dart';

class FavouriteScreen extends StatelessWidget {
  final List favouriteMeals;

  FavouriteScreen(this.favouriteMeals);

  @override
  Widget build(BuildContext context) {
    return MealItemList(
      meals: favouriteMeals,
    );
  }
}
