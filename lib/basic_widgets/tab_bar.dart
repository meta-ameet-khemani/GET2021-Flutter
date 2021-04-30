import 'package:flutter/material.dart';

class MyTabBar extends StatefulWidget {
  @override
  _MyTabBarState createState() => _MyTabBarState();
}

class _MyTabBarState extends State<MyTabBar>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: 6, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<Widget> getTabs() {
    List<Widget> tabs = [];
    tabs.add(Container(
      width: 100,
      child: Tab(
        icon: Icon(Icons.flight), // increasing height is causing error
        child: Text(
          'Very Safe',
          style: TextStyle(color: Colors.black),
        ),
      ),
    ));
    tabs.add(Container(
      width: 100,
      child: Tab(
        icon: Icon(Icons.train),
        child: Text('Risky'),
      ),
    ));
    tabs.add(Container(
      width: 100,
      child: Tab(
        icon: Icon(Icons.directions_bike_sharp),
        child: Text('Very Risky'),
      ),
    ));
    tabs.add(Container(
      width: 100,
      child: Tab(
        icon: Icon(Icons.flight),
        child: Text(
          'Very Safe',
          style: TextStyle(color: Colors.black),
        ),
      ),
    ));
    tabs.add(Container(
      width: 100,
      child: Tab(
        icon: Icon(Icons.train),
        child: Text('Risky'),
      ),
    ));
    tabs.add(Container(
      width: 100,
      child: Tab(
        icon: Icon(Icons.directions_bike_sharp),
        child: Text('Very Risky'),
      ),
    ));
    return tabs;
  }

  List<Widget> getTabView() {
    List<Widget> tabViews = [];
    tabViews.add(Center(
      child: Text('Flight'),
    ));
    tabViews.add(Center(
      child: Text('Train'),
    ));
    tabViews.add(Center(
      child: Text('Cycle'),
    ));
    tabViews.add(Center(
      child: Text('Flight'),
    ));
    tabViews.add(Center(
      child: Text('Train'),
    ));
    tabViews.add(Center(
      child: Text('Cycle'),
    ));
    return tabViews;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black45,
        toolbarHeight: 150,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Select Prefered Route'),
          ],
        ),
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          indicatorColor: Colors.amberAccent,
          indicatorWeight: 5,
          indicatorSize: TabBarIndicatorSize.label,
          labelPadding: EdgeInsets.all(10),
          // indicatorPadding: EdgeInsets.all(20),
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.amberAccent,
          ),
          tabs: getTabs(),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: getTabView(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _tabController.index < 5 ? _tabController.animateTo(_tabController.index + 1) : '';
        },
        child: Icon(Icons.arrow_right),
      ),
    );
  }
}
