import 'package:flutter/material.dart';
import 'caching_example/caching_example.dart';
import 'cached_network_image/cached_network_image_widget.dart';
import 'carousel_slider/carousel_slider_widget.dart';
import 'fade_in_image/fade_in_image_widget.dart';
import 'safearea/safearea_widget.dart';
import 'interactive_view/interactive_view.dart';
import 'draggable/draggable_widget.dart';
import 'dismissible/dismissible_widget.dart';
import 'alert_dialog/basic_alert/basic_alert.dart';
import 'align/align_widget.dart';
import 'aspect_ratio/aspect_ratio.dart';
import 'autocmplete/autocomplete_widget.dart';
import 'baseline/baseline_widget.dart';
import 'basic_widgets/tab_bar.dart';
import 'constrained_box/constrained_box.dart';
import 'draggable_scrollable_sheet/draggable_scrollable_sheet_widget.dart';
import 'expanded/expanded_widget.dart';
import 'grid_view/grid_view.dart';
import 'intrinsic_height/intrinsic_height.dart';
import 'intrinsic_width/intrinsic_width.dart';
import 'page_view/my_page_view.dart';
import 'placeholder/placeholder.dart';
import 'progress_indicator/progress_indicator.dart';
import 'single_child_scroll_view/single_child_scroll_view_1.dart';
import 'single_child_scroll_view/single_child_scroll_view_2.dart';
import 'sized_box/sized_box.dart';
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
      debugShowCheckedModeBanner: false,
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

        case "dismissible":
          widgetToShow = DismissibleWidget();
          appBarTitle = "Dismissible Widget";
          break;

        case "draggable":
          widgetToShow = DraggableWidget();
          appBarTitle = "Draggable Widget";
          break;

        case "draggablescrollablesheet":
          widgetToShow = DraggableScrollableSheetWidget();
          appBarTitle = "Draggable Scrollable Sheet Widget";
          break;

        case "interactiveview":
          widgetToShow = InteractiveViewWidget();
          appBarTitle = "Interactive View Widget";
          break;

        case "safearea":
          widgetToShow = SafeAreaWidget();
          appBarTitle = "SafeArea Widget";
          break;

        case "fadeinimage":
          widgetToShow = FadeInImageWidget();
          appBarTitle = "FadeInImage Widget";
          break;

        case "cachednetworkimage":
          widgetToShow = CachedNetworkImageWidget();
          appBarTitle = "Cached Network Image Widget";
          break;

        case "carouselslider":
          widgetToShow = CarouselSliderWidget();
          appBarTitle = "Carousel Slider Widget";
          break;

        case "cachingExample":
          widgetToShow = CachingExample();
          appBarTitle = "Caching Example";
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
      // comment this for safearea widget only
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
