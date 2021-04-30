import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  final Function changeWidget;

  MainDrawer(this.changeWidget);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero, // didn't get it
      children: [
        UserAccountsDrawerHeader(
          currentAccountPicture: CircleAvatar(
            backgroundImage: AssetImage('assets/images/profile.jpg'),
          ),
          accountName: Text(
            'Ameet Khemani',
            style: TextStyle(fontSize: 18),
          ),
          accountEmail: Text(
            'ameet.khemani@metacube.com',
            style: TextStyle(fontSize: 14),
          ),
        ),
        ListTile(
          leading: Icon(Icons.table_rows),
          title: Text(
            'Row',
            style: TextStyle(fontSize: 25),
          ),
          onTap: () => changeWidget('row'),
        ),
        ListTile(
          leading: Icon(Icons.view_column),
          title: Text(
            'Column',
            style: TextStyle(fontSize: 25),
          ),
          onTap: () => changeWidget('column'),
        ),
        ListTile(
          leading: Icon(Icons.list),
          title: Text(
            'Basic List',
            style: TextStyle(fontSize: 25),
          ),
          onTap: () => changeWidget('basic_list'),
        ),
        ListTile(
          leading: Icon(Icons.list),
          title: Text(
            'Grid List',
            style: TextStyle(fontSize: 25),
          ),
          onTap: () => changeWidget('grid_list'),
        ),
        ListTile(
          leading: Icon(Icons.list),
          title: Text(
            'Long List',
            style: TextStyle(fontSize: 25),
          ),
          onTap: () => changeWidget('long_list'),
        ),
        ListTile(
          leading: Icon(Icons.check_box_outline_blank),
          title: Text(
            'Container',
            style: TextStyle(fontSize: 25),
          ),
          onTap: () => changeWidget('container'),
        ),
        ListTile(
          leading: Icon(Icons.stacked_line_chart),
          title: Text(
            'Stack',
            style: TextStyle(fontSize: 25),
          ),
          onTap: () => changeWidget('stack'),
        ),
        ListTile(
          leading: Icon(Icons.text_fields),
          title: Text(
            'Text',
            style: TextStyle(fontSize: 25),
          ),
          onTap: () => changeWidget('text'),
        ),
        ListTile(
          leading: Icon(Icons.text_fields),
          title: Text(
            'Snackbar',
            style: TextStyle(fontSize: 25),
          ),
          onTap: () => changeWidget('snackbar'),
        ),
        ListTile(
          leading: Icon(Icons.text_fields),
          title: Text(
            'TabBar',
            style: TextStyle(fontSize: 25),
          ),
          onTap: () => changeWidget('tabbar'),
        ),
      ],
    );
  }
}
