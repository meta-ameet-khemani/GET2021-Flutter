import 'package:flutter/material.dart';
import './basic_widgets/list/grid.dart';
import './basic_widgets/list/long.dart';
import './basic_widgets/list/basic.dart';
import './basic_widgets/column.dart';
import './basic_widgets/container.dart';
import './basic_widgets/row.dart';
import './basic_widgets/stack.dart';
import './basic_widgets/text.dart';
import './drawer.dart';

void main() {
  runApp(SingleAppForAll());
}

class SingleAppForAll extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String appBarTitle = "Row Widget";
  Widget widgetToShow = MyRow();

  Widget _getWidget(String choice) {
    setState(() {
      switch(choice) {
        case "column":
          widgetToShow = MyColumn();
          appBarTitle = "Column Widget";
          break;

        case "container":
          widgetToShow = MyContainer();
          appBarTitle = "Container Widget";
          break;

        case "basic_list":
          widgetToShow = MyBasicList();
          appBarTitle = "Basic List Widget";
          break;

        case "grid_list":
          widgetToShow = MyGridList();
          appBarTitle = "Grid List Widget";
          break;

        case "long_list":
          widgetToShow = MyLongList();
          appBarTitle = "Long List Widget";
          break;

        case "row":
          widgetToShow = MyRow();
          appBarTitle = "Row Widget";
          break;

        case "stack":
          widgetToShow = MyStack();
          appBarTitle = "Stack Widget";
          break;

        case "text":
          widgetToShow = MyText();
          appBarTitle = "Text Widget";
          break;

        default:
          widgetToShow = MyRow();
          appBarTitle = "Row Widget";
          break;
      }
    });
    // Navigator.pop(context);
    Navigator.of(context).pop();
    return widgetToShow;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
      ),
      drawer: Drawer(
        child: MainDrawer(_getWidget),
      ),
      body: Center(
        child: widgetToShow,
      ),
    );
  }
}
