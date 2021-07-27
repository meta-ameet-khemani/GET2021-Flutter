import 'package:flutter/material.dart';

class SliverExample extends StatefulWidget {
  @override
  _SliverExampleState createState() => _SliverExampleState();
}

class _SliverExampleState extends State<SliverExample> {
  int _currentIndex = 0;
  List<Widget> _pages = [
    SimpleSliver(),
    SomeMoreSlivers(),
    SimpleTab(),
  ];

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(widget.title),
      // ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onTap,
        elevation: 1,
        backgroundColor: Colors.yellowAccent[100],
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.star_outline),
            label: 'Basic',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.donut_large),
            label: 'More',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.share),
            label: 'Share',
          ),
        ],
      ),
    );
  }
}

class SimpleSliver extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(),
        bottomNavigationBar: Container(
          color: Color(0xFF3F5AA6),
          child: TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorPadding: EdgeInsets.all(5.0),
            indicatorColor: Colors.blue,
            tabs: [
              Tab(
                text: "Transactions",
                icon: Icon(Icons.euro_symbol),
              ),
              Tab(
                text: "Bills",
                icon: Icon(Icons.assignment),
              ),
              Tab(
                text: "Balance",
                icon: Icon(Icons.account_balance_wallet),
              ),
              Tab(
                text: "Options",
                icon: Icon(Icons.settings),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Container(child: Icon(Icons.directions_car)),
            Container(child: Icon(Icons.directions_transit)),
            Container(child: Icon(Icons.directions_bike)),
            Container(child: Icon(Icons.directions_bike)),
          ],
        ),
      ),
    );
  }
}

class SomeMoreSlivers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          leading: Icon(Icons.chevron_left),
          title: Text('Sliver Demo'),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.share),
            ),
          ],
          expandedHeight: 120,
          flexibleSpace: FlexibleSpaceBar(
            title: Text('Basic Sliver Example'),
          ),
          // floating: true,
          // pinned: true,
        ),
        SliverPersistentHeader(
          delegate: CustomDelegate(Colors.pink, 'Sliver Persistent Header'),
          // floating: true,
        ),
        SliverFixedExtentList(
          delegate: SliverChildListDelegate([
            Container(
              color: Colors.black,
            ),
            Container(
              color: Colors.redAccent,
            ),
            Container(
              color: Colors.greenAccent,
            ),
          ]),
          itemExtent: 50,
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Container(
                color: Colors.orange[100 * (index % 9)],
                height: 50,
                alignment: Alignment.center,
                child: Text('Orange $index'),
              );
            },
            childCount: 10,
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            alignment: Alignment.center,
            height: 100,
            color: Colors.brown,
            child: Text(
              'SliverToBoxAdapter',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
        SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 5.0,
            mainAxisSpacing: 5.0,
          ),
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Container(
                margin: EdgeInsets.all(10.0),
                alignment: Alignment.center,
                // color: Colors.purple[100 * (index % 9)],
                color: Colors.amberAccent,
                child: Text('Grid $index'),
              );
            },
            childCount: 20,
          ),
        ),
        SliverGrid.count(
          crossAxisCount: 3,
          children: [
            Container(
              color: Colors.red,
            ),
            Container(
              color: Colors.green,
            ),
            Container(
              color: Colors.blue,
            ),
            Container(
              color: Colors.black,
            ),
          ],
        ),
        SliverGrid.extent(
          maxCrossAxisExtent: 100,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          // childAspectRatio: 2,
          children: [
            Container(
              color: Colors.red,
            ),
            Container(
              color: Colors.green,
            ),
            Container(
              color: Colors.blue,
            ),
            Container(
              color: Colors.black,
            ),
          ],
        )
      ],
    );
  }
}

class CustomDelegate extends SliverPersistentHeaderDelegate {
  final Color _backgroundColor;
  final String _title;

  CustomDelegate(this._backgroundColor, this._title);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: this._backgroundColor,
      child: Text(
        this._title,
        style: TextStyle(
          fontSize: 20,
        ),
      ),
      height: 80,
      alignment: Alignment.center,
    );
  }

  @override
  double get maxExtent => 80;

  @override
  double get minExtent => 50;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

class SimpleTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Simple Tab Demo'),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.bus_alert)),
              Tab(icon: Icon(Icons.car_rental)),
              Tab(icon: Icon(Icons.attach_email)),
              Tab(icon: Icon(Icons.baby_changing_station)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Container(child: Icon(Icons.directions_car)),
            Container(child: Icon(Icons.directions_transit)),
            Container(child: Icon(Icons.directions_bike)),
            Container(child: Icon(Icons.directions_boat_filled)),
          ],
        ),
      ),
    );
  }
}
