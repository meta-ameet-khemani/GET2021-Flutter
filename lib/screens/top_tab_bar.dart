import 'package:flutter/material.dart';
import '../screens/all_category_screen.dart';
import '../screens/favourities.dart';

class TopTabBars extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Appbar'),
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.category),
                text: 'Categories',
              ),
              Tab(
                icon: Icon(Icons.star),
                text: 'Favorites',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            CategoryScreen(),
            Favourites([]),
          ],
        ),
      ),
    );
  }
}
