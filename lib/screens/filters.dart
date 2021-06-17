import 'package:flutter/material.dart';
import 'main_drawer.dart';

class Filters extends StatefulWidget {

  static const routeName = '/filters';
  final Function _setFilterOptions;
  final Map<String, bool> _filterOptions;

  Filters(this._filterOptions, this._setFilterOptions);

  @override
  _FiltersState createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {

  Widget _buildSwitchListTile (String title, String subTitle, bool originalValue, Function changeValue) {
    return SwitchListTile(
      value: originalValue,
      onChanged: changeValue as void Function(bool)?,
      title: Text(title),
      subtitle: Text(subTitle),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final optionsToSend = {
                  'curd' : widget._filterOptions['curd'],
                  'vegan' : widget._filterOptions['vegan'],
                  'vegetarian' : widget._filterOptions['vegetarian'],
                  'oil' : widget._filterOptions['oil']
                };
                widget._setFilterOptions(optionsToSend);
              },
            ),
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 100),
              child: Text('My preferences', style: TextStyle(fontSize: 25),),
            ),
            _buildSwitchListTile(
              'Curd Free',
              'My meal should curd free',
               widget._filterOptions['curd']!,
               (newValue) {
                setState(() {
                  widget._filterOptions['curd'] = newValue;
                });
              }
            ),
            _buildSwitchListTile(
              'Vegan',
              'My meal should vegan',
               widget._filterOptions['vegan']!,
               (newValue) {
                setState(() {
                  widget._filterOptions['vegan'] = newValue;
                });
              }
            ),
            _buildSwitchListTile(
              'Vegetarian',
              'My meal should vegetarian',
               widget._filterOptions['vegetarian']!,
               (newValue) {
                setState(() {
                  widget._filterOptions['vegetarian'] = newValue;
                });
              }
            ),
            _buildSwitchListTile(
              'Oil Free',
              'My meal should oil free',
               widget._filterOptions['oil']!,
               (newValue) {
                setState(() {
                  widget._filterOptions['oil'] = newValue;
                });
              }
            ),
          ],
        ),
      ),
    );
  }
}
