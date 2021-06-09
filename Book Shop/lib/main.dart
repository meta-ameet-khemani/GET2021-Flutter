import 'package:flutter/material.dart';
import 'components/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class TabBarControllerWidget extends StatefulWidget {
  const TabBarControllerWidget({Key key}) : super(key: key);
  @override
  _TabBarControllerWidgetState createState() => _TabBarControllerWidgetState();
}

class _TabBarControllerWidgetState extends State<TabBarControllerWidget>
    with SingleTickerProviderStateMixin {
  final List<Tab> myTabs = <Tab>[
    Tab(
      child: Text(
        'LEFT',
        style: TextStyle(
          color: Colors.black,
        ),
      ),
    ),
    Tab(
      child: Text(
        'MIDDLE',
        style: TextStyle(
          color: Colors.black,
        ),
      ),
    ),
    Tab(
      child: Text(
        'RIGHT',
        style: TextStyle(
          color: Colors.black,
        ),
      ),
    ),
  ];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   bottom: TabBar(
        //     controller: _tabController,
        //     tabs: myTabs,
        //   ),
        // ),
        body: Column(
          children: [
            TabBar(
              controller: _tabController,
              tabs: myTabs,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              color: Colors.yellow[100],
              child: TabBarView(
                controller: _tabController,
                children: myTabs.map((Tab tab) {
                  return Center(
                    child: Text(
                      'This is the label tab',
                      style: const TextStyle(fontSize: 36),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TestScreen extends StatefulWidget {
  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 3,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.red[200],
      //   shadowColor: Colors.transparent,
      // ),
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: Column(
          children: [
            TabBar(
              onTap: (index) {
                print(index);
              },
              controller: _tabController,
              tabs: [
                Tab(
                  child: Text(
                    'Description',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    'Reviews (20)',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    'Similliar',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            TabBarView(
              controller: _tabController,
              children: [
                Container(
                  child: Text('with best practi'),
                ),
                Container(
                  child: Text('with best practi'),
                ),
                Container(
                  child: Text('with best practi'),
                ),
              ],
            ),
            // Stack(
            //   alignment: Alignment.center,
            //   children: [
            //     Container(
            //       height: MediaQuery.of(context).size.height * 0.5,
            //       width: MediaQuery.of(context).size.width,
            //       color: Colors.red[200],
            //     ),
            //     Container(
            //       height: MediaQuery.of(context).size.height * 0.25,
            //       width: MediaQuery.of(context).size.width * 0.4,
            //       color: Colors.yellow,
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
      // Column(
      //   children: [
      //     Container(
      //       height: MediaQuery.of(context).size.height * 0.5,
      //       color: Colors.red[200],
      //       width: MediaQuery.of(context).size.width,
      //       // child: Text(
      //       //   'asdf',
      //       //   style: TextStyle(
      //       //     fontSize: 40,
      //       //   ),
      //       // ),
      //     ),
      //     Container(
      //       height: MediaQuery.of(context).size.height * 0.5,
      //       color: Colors.green[200],
      //       width: MediaQuery.of(context).size.width,
      //     ),
      //   ],
      // ),
    );
  }
}
