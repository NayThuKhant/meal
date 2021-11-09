import 'package:flutter/material.dart';
import 'package:meal/widgets/custom_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Map<String, bool> _filters;
  final Function _setFilters;

  FilterScreen(this._filters, this._setFilters);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  void initState() {
    print(widget._filters);
    _glutenFree = widget._filters['gluten-free'] ?? false;
    _lactoseFree = widget._filters['lactose-free'] ?? false;
    _vegan = widget._filters['vegan'] ?? false;
    _vegetarian = widget._filters['vegetarian'] ?? false;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              widget._setFilters({
                "gluten-free": _glutenFree,
                "lactose-free": _lactoseFree,
                "vegetarian": _vegetarian,
                "vegan": _vegan
              });

              showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (_) {
                    return AlertDialog(
                      title: const Text('Filters updated!'),
                      content: Text(
                        'Your filtered meals are ready.',
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                      actions: <Widget>[
                        TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: const Text('OK'))
                      ],
                    );
                  });
            },
            icon: Icon(Icons.save),
          ),
        ],
      ),
      drawer: CustomDrawer(),
      body: Column(
        children: [
          Container(
            height: 50,
            width: double.infinity,
            alignment: Alignment.center,
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                buildSwitchListTile(context, "Gluten Free",
                    "Only include gluten free meals", _glutenFree, (newValue) {
                  setState(() {
                    _glutenFree = newValue;
                  });
                }),
                buildSwitchListTile(
                    context,
                    "Lactose Free",
                    "Only include lactose free meals",
                    _lactoseFree, (newValue) {
                  setState(() {
                    _lactoseFree = newValue;
                  });
                }),
                buildSwitchListTile(context, "Vegetarian",
                    "Only include vegetarian meals", _vegetarian, (newValue) {
                  setState(() {
                    _vegetarian = newValue;
                  });
                }),
                buildSwitchListTile(
                    context, "Vegan", "Only include vegan meals", _vegan,
                    (newValue) {
                  setState(() {
                    _vegan = newValue;
                  });
                }),
              ],
            ),
          )
        ],
      ),
    );
  }

  SwitchListTile buildSwitchListTile(
    BuildContext context,
    String title,
    String subtitle,
    bool currentValue,
    Function(bool) onChange,
  ) {
    return SwitchListTile(
      title: Text(
        title,
        style: Theme.of(context).textTheme.subtitle2,
      ),
      subtitle: Text(subtitle),
      value: currentValue,
      onChanged: onChange,
    );
  }
}
