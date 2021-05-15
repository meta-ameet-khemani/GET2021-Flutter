import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  final Function changeWidget;

  MainDrawer(this.changeWidget);

  @override
  build(BuildContext context) {
    return Scrollbar(
      thickness: 10,
      child: ListView(
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
            leading: Icon(Icons.backup_table),
            title: Text(
              'Snackbar',
              style: TextStyle(fontSize: 25),
            ),
            onTap: () => changeWidget('snackbar'),
          ),
          ListTile(
            leading: Icon(Icons.table_rows_rounded),
            title: Text(
              'TabBar',
              style: TextStyle(fontSize: 25),
            ),
            onTap: () => changeWidget('tabbar'),
          ),
          ListTile(
            leading: Icon(Icons.find_replace),
            title: Text(
              'Placeholder',
              style: TextStyle(fontSize: 25),
            ),
            onTap: () => changeWidget('placeholder'),
          ),
          ListTile(
            leading: Icon(Icons.add_alert),
            title: Text(
              'Basic Alert Dialog',
              style: TextStyle(fontSize: 25),
            ),
            onTap: () => changeWidget('basic-alert'),
          ),
          ListTile(
            leading: Icon(Icons.format_align_center),
            title: Text(
              'Align ',
              style: TextStyle(fontSize: 25),
            ),
            onTap: () => changeWidget('align'),
          ),
          ListTile(
            leading: Icon(Icons.aspect_ratio),
            title: Text(
              'Aspect Ratio ',
              style: TextStyle(fontSize: 25),
            ),
            onTap: () => changeWidget('aspect-ratio'),
          ),
          ListTile(
            leading: Icon(Icons.compare_arrows_sharp),
            title: Text(
              'Autocomplete ',
              style: TextStyle(fontSize: 25),
            ),
            onTap: () => changeWidget('autocomplete'),
          ),
          ListTile(
            leading: Icon(Icons.format_underline),
            title: Text(
              'Baseline ',
              style: TextStyle(fontSize: 25),
            ),
            onTap: () => changeWidget('baseline'),
          ),
          ListTile(
            leading: Icon(Icons.add_box_outlined),
            title: Text(
              'Contrained Box ',
              style: TextStyle(fontSize: 25),
            ),
            onTap: () => changeWidget('constrained-box'),
          ),
          ListTile(
            leading: Icon(Icons.expand),
            title: Text(
              'Expanded ',
              style: TextStyle(fontSize: 25),
            ),
            onTap: () => changeWidget('expanded'),
          ),
          ListTile(
            leading: Icon(Icons.grid_view),
            title: Text(
              'Grid View ',
              style: TextStyle(fontSize: 25),
            ),
            onTap: () => changeWidget('grid-view'),
          ),
          ListTile(
            leading: Icon(Icons.input),
            title: Text(
              'Input Selection ',
              style: TextStyle(fontSize: 25),
            ),
            onTap: () => changeWidget('input-selection'),
          ),
          ListTile(
            leading: Icon(Icons.vertical_align_center_rounded),
            title: Text(
              'Intrinsic Height ',
              style: TextStyle(fontSize: 25),
            ),
            onTap: () => changeWidget('intrinsic-height'),
          ),
          ListTile(
            leading: Icon(Icons.horizontal_rule),
            title: Text(
              'Intrinsic Width ',
              style: TextStyle(fontSize: 25),
            ),
            onTap: () => changeWidget('intrinsic-width'),
          ),
          ListTile(
            leading: Icon(Icons.pages),
            title: Text(
              'Page View ',
              style: TextStyle(fontSize: 25),
            ),
            onTap: () => changeWidget('page-view'),
          ),
          ListTile(
            leading: Icon(Icons.panorama_fish_eye_rounded),
            title: Text(
              'Progress Indicator ',
              style: TextStyle(fontSize: 25),
            ),
            onTap: () => changeWidget('progress-indicator'),
          ),
          ListTile(
            leading: Icon(Icons.system_update_tv_outlined),
            title: Text(
              'Single Child Scroll View 1',
              style: TextStyle(fontSize: 25),
            ),
            onTap: () => changeWidget('single-child-1'),
          ),
          ListTile(
            leading: Icon(Icons.system_update_tv_outlined),
            title: Text(
              'Single Child Scroll View 2',
              style: TextStyle(fontSize: 25),
            ),
            onTap: () => changeWidget('single-child-2'),
          ),
          ListTile(
            leading: Icon(Icons.check_box_outline_blank_outlined),
            title: Text(
              'Sized Box',
              style: TextStyle(fontSize: 25),
            ),
            onTap: () => changeWidget('sized-box'),
          ),
        ],
      ),
    );
  }
}
