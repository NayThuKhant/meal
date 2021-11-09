import 'dart:core';

import 'package:flutter/material.dart';

import '../dummy_data/meals.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal';

  final Function toggleFavourite;
  final Function isMealFavorite;

  MealDetailScreen(this.toggleFavourite, this.isMealFavorite);

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments;
    final meal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                meal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            ...ListItems(context, "Ingredients", meal.ingredients),
            ...ListItems(context, "Steps", meal.steps),
            buildListTile(context, "Gluten Free ?", meal.isGlutenFree),
            buildListTile(context, "Is Vegan ?", meal.isVegan),
            buildListTile(context, "Is Vegetarian ?", meal.isVegetarian),
            buildListTile(context, "Lactose Free ?", meal.isLactoseFree)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => toggleFavourite(mealId),
        child:
            isMealFavorite(mealId) ? Icon(Icons.star) : Icon(Icons.star_border),
      ),
    );
  }

  ListTile buildListTile(BuildContext context, String text, bool free) {
    final Color color = free ? Colors.green : Colors.red;
    final IconData icon = free ? Icons.work : Icons.dangerous;
    print(icon);
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: color,
        radius: 15,
        child: Icon(
          icon,
          size: 15,
        ),
      ),
      title: Text(
        text,
        style: Theme.of(context).textTheme.subtitle2,
      ),
    );
  }

  List<dynamic> ListItems(BuildContext context, title, list) {
    return [
      Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Text(
          title,
          style: Theme.of(context).textTheme.subtitle1,
        ),
      ),
      ...list.map((item) {
        var index = list.indexOf(item);
        return ListTile(
          leading: CircleAvatar(
            radius: 15,
            child: Text(
              index.toString(),
              style: Theme.of(context).textTheme.subtitle2,
            ),
          ),
          title: Text(
            list[index],
            style: Theme.of(context).textTheme.subtitle2,
          ),
        );
      }).toList(),
      Divider(
        thickness: 1,
      )
    ];
  }
}
