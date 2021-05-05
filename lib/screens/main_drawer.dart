import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'filters.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 150,
            color: Colors.deepOrangeAccent,
            alignment: Alignment.bottomCenter,
            child: Text(
              'My Meals App',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
          ),
          SizedBox(height: 20),
          ListTile(
            onTap: () { Navigator.of(context).pushNamed('/'); },
            leading: Icon(
              Icons.restaurant,
              size: 30,
            ),
            title: Text(
              'Meals',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, letterSpacing: 1.5),
            ),
          ),
          ListTile(
            onTap: () { Navigator.of(context).pushReplacementNamed(Filters.routeName); },
            leading: Icon(
              Icons.settings,
              size: 30,
            ),
            title: Text(
              'Filters',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, letterSpacing: 1.5),
            ),
          ),
        ],
      ),
    );
  }
}
