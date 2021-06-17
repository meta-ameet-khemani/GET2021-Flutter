import 'widget/homepage_header.dart';
import 'modal/list_item.dart';
import 'shared/list_items/list_items.dart';
import 'widget/item_list.dart';

import 'package:flutter/material.dart';

class HolidayHomepage extends StatefulWidget {
  @override
  _HolidayHomepageState createState() => _HolidayHomepageState();
}

class _HolidayHomepageState extends State<HolidayHomepage>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<double>? _animation;
  final GlobalKey<AnimatedListState> _keys = GlobalKey<AnimatedListState>();
  Tween<Offset> _offset = Tween(begin: Offset(1, 0), end: Offset(0, 0));
  int count = 0;
  List<ListItem> _items = [];

  @override
  void initState() {
    _items = items;
    _animationController = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    );
    _animationController!.forward();
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController!);
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      _items.forEach((element) {
        int a = count++;
        _keys.currentState!.insertItem(a);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 0,
        ),
        child: Column(
          children: <Widget>[
            HomepageHeader(
              animationController: _animationController,
            ),
            ItemList(
              keys: _keys,
              items: _items,
              offset: _offset,
            ),
          ],
        ),
      ),
    );
  }
}
