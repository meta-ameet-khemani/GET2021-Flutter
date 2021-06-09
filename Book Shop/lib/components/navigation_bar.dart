import 'package:flutter/material.dart';

class NavigationBottomBar extends StatefulWidget {
  @override
  _NavigationBottomBarState createState() => _NavigationBottomBarState();
}

class _NavigationBottomBarState extends State<NavigationBottomBar> {
  int _currentTabIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: BottomNavigationBar(
        currentIndex: _currentTabIndex,
        iconSize: 30,
        // fixedColor: Colors.white,
        selectedItemColor: Colors.red[300],
        onTap: (value) {
          setState(() {
            _currentTabIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              // size: 30,
              // color: Colors.red[300],
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.verified_user,
              // size: 30,
              // color: Colors.red[300],
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.usb_rounded,
              // size: 30,
              // color: Colors.red[300],
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
