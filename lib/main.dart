import 'package:flutter/material.dart';
import 'package:single_app_for_basic_widgets/alert_dialog/basic_alert/basic_alert.dart';
import 'package:single_app_for_basic_widgets/align/align_widget.dart';
import 'package:single_app_for_basic_widgets/aspect_ratio/aspect_ratio.dart';
import 'package:single_app_for_basic_widgets/autocmplete/autocomplete_widget.dart';
import 'package:single_app_for_basic_widgets/baseline/baseline_widget.dart';
import 'package:single_app_for_basic_widgets/basic_widgets/tab_bar.dart';
import 'package:single_app_for_basic_widgets/constrained_box/constrained_box.dart';
import 'package:single_app_for_basic_widgets/expanded/expanded_widget.dart';
import 'package:single_app_for_basic_widgets/grid_view/grid_view.dart';
import 'package:single_app_for_basic_widgets/intrinsic_height/intrinsic_height.dart';
import 'package:single_app_for_basic_widgets/intrinsic_width/intrinsic_width.dart';
import 'package:single_app_for_basic_widgets/page_view/my_page_view.dart';
import 'package:single_app_for_basic_widgets/placeholder/placeholder.dart';
import 'package:single_app_for_basic_widgets/progress_indicator/progress_indicator.dart';
import 'package:single_app_for_basic_widgets/single_child_scroll_view/single_child_scroll_view_1.dart';
import 'package:single_app_for_basic_widgets/single_child_scroll_view/single_child_scroll_view_2.dart';
import 'package:single_app_for_basic_widgets/sized_box/sized_box.dart';
import './basic_widgets/snack_bar.dart';
import './basic_widgets/list/grid.dart';
import './basic_widgets/list/long.dart';
import './basic_widgets/list/basic.dart';
import './basic_widgets/column.dart';
import './basic_widgets/container.dart';
import './basic_widgets/row.dart';
import './basic_widgets/stack.dart';
import './basic_widgets/text.dart';
import './drawer.dart';
import 'input_and_selection/input_and_selection.dart';

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
      switch (choice) {
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

        case "snackbar":
          widgetToShow = MySnackBar();
          appBarTitle = "Snackbar Widget";
          break;

        case "tabbar":
          widgetToShow = MyTabBar();
          appBarTitle = "Tabbar Widget";
          break;

        case "placeholder":
          widgetToShow = MyPlaceholder();
          appBarTitle = "Placeholder Widget";
          break;

        case "basic-alert":
          widgetToShow = MyAlertDialog();
          appBarTitle = "Basic Alert Dialog Widget";
          break;

        case "align":
          widgetToShow = AlignWidget();
          appBarTitle = "Align Widget";
          break;

        case "aspect-ratio":
          widgetToShow = MyAspectRatio();
          appBarTitle = "Aspect Ratio Widget";
          break;

        case "autocomplete":
          widgetToShow = AutocompleteWidget();
          appBarTitle = "Autocomplete Widget";
          break;

        case "baseline":
          widgetToShow = MyBaselineWidget();
          appBarTitle = "Baseline Widget";
          break;

        case "constrained-box":
          widgetToShow = MyConstrainedBoxWidget();
          appBarTitle = "Contrained Box Widget";
          break;

        case "expanded":
          widgetToShow = MyExapandedWidget();
          appBarTitle = "Expanded Widget";
          break;

        case "grid-view":
          widgetToShow = MyGridView();
          appBarTitle = "Grid View Widget";
          break;

        case "input-selection":
          widgetToShow = MyInputAndSelection();
          appBarTitle = "Input Selection Widget";
          break;

        case "intrinsic-height":
          widgetToShow = MyIntrinsicHeightWidget();
          appBarTitle = "Intrinsic Height Widget";
          break;

        case "intrinsic-width":
          widgetToShow = MyIntrinsicWidth();
          appBarTitle = "Intrinsic Width Widget";
          break;

        case "page-view":
          widgetToShow = MyPageView();
          appBarTitle = "Page View Widget";
          break;

        case "progress-indicator":
          widgetToShow = MyProgressIndicator();
          appBarTitle = "Progress Indicator Widget";
          break;

        case "single-child-1":
          widgetToShow = MySingleChildScrollView1();
          appBarTitle = "Single Child Scroll View Widget";
          break;

        case "single-child-2":
          widgetToShow = MySingleChildScrollView2();
          appBarTitle = "Single Child Scroll View Widget";
          break;

        case "sized-box":
          widgetToShow = MySizedBoxWidget();
          appBarTitle = "Sized Box Widget";
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
