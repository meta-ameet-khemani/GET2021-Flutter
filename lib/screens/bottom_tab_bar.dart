import 'package:flutter/material.dart';
import 'all_category_screen.dart';
import 'favourities.dart';
import 'main_drawer.dart';

class BottomTabBar extends StatefulWidget {
  @override
  _BottomTabBarState createState() => _BottomTabBarState();
}

class _BottomTabBarState extends State<BottomTabBar> {

  int _currentIndex = 0;
  final List<Map<String, Object>> _widgetList = [
    {'widget' : CategoryScreen(), 'title' : 'Categories'},
    {'widget' : Favourites(), 'title' : 'Favourites'},
  ];

  void _changeTab (int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_widgetList[_currentIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: _widgetList[_currentIndex]['widget'],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        selectedFontSize: 20,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, backgroundColor: Colors.brown),
        unselectedFontSize: 12,
        backgroundColor: Colors.cyan,
        currentIndex: _currentIndex,
        onTap: _changeTab,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.category), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favourites'),
        ],
      ),
    );
  }
}
