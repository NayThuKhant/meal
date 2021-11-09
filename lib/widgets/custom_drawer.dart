import 'package:flutter/material.dart';
import 'package:meal/screens/filter_screen.dart';
import 'package:meal/screens/home_screen.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          buildHeader(context),
          buildNavigationItem(
              context: context,
              title: 'Meals',
              icon: Icons.restaurant,
              routeName: HomeScreen.routeName),
          buildNavigationItem(
            context: context,
            title: 'Filters',
            icon: Icons.settings,
            routeName: FilterScreen.routeName,
          ),
        ],
      ),
    );
  }

  ListTile buildNavigationItem({
    required BuildContext context,
    required String title,
    required IconData icon,
    required routeName,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: "RobotoCondensed",
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: () {
        Navigator.of(context).pushReplacementNamed(routeName);
      },
    );
  }

  Container buildHeader(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      width: double.infinity,
      height: 100,
      alignment: Alignment.bottomLeft,
      color: Theme.of(context).primaryColor,
      child: Text(
        'Meals',
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          fontFamily: "RobotoCondensed",
        ),
      ),
    );
  }
}
