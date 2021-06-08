import 'package:flutter/material.dart';

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

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> _imageList =
      List.generate(5, (index) => 'assets/$index.jpg');
  int _currentTabIndex = 0;
  int _currentCategoryIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Hi, User'),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 15,
                      ),
                      child: Text(
                        'Discover Latest Book',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 15,
                      ),
                      child: Container(
                        height: 35,
                        color: Colors.grey[200],
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Search book ...',
                            suffixIcon: Container(
                              decoration: BoxDecoration(
                                color: Colors.red[300],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Icon(
                                Icons.search,
                                color: Colors.white,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          FlatButton(
                            onPressed: () {
                              setState(() {
                                _currentCategoryIndex = 0;
                              });
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'New',
                                  style: _currentCategoryIndex == 0
                                      ? TextStyle(
                                          fontWeight: FontWeight.bold,
                                        )
                                      : TextStyle(),
                                ),
                                _currentCategoryIndex == 0
                                    ? Container(
                                        width: 10,
                                        height: 2,
                                        decoration: BoxDecoration(
                                          color: Colors.black,
                                        ),
                                      )
                                    : Text(''),
                              ],
                            ),
                          ),
                          FlatButton(
                            onPressed: () {
                              setState(() {
                                _currentCategoryIndex = 1;
                              });
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Trending',
                                  style: _currentCategoryIndex == 1
                                      ? TextStyle(
                                          fontWeight: FontWeight.bold,
                                        )
                                      : TextStyle(),
                                ),
                                _currentCategoryIndex == 1
                                    ? Container(
                                        width: 10,
                                        height: 2,
                                        decoration: BoxDecoration(
                                          color: Colors.black,
                                        ),
                                      )
                                    : Text(''),
                              ],
                            ),
                          ),
                          FlatButton(
                            onPressed: () {
                              setState(() {
                                _currentCategoryIndex = 2;
                              });
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Best Seller',
                                  style: _currentCategoryIndex == 2
                                      ? TextStyle(
                                          fontWeight: FontWeight.bold,
                                        )
                                      : TextStyle(),
                                ),
                                _currentCategoryIndex == 2
                                    ? Container(
                                        width: 10,
                                        height: 2,
                                        decoration: BoxDecoration(
                                          color: Colors.black,
                                        ),
                                      )
                                    : Text(''),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(
                            5,
                            (index) => buildRowItem(context, index),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Text(
                        'Popular',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 4),
                      child: Container(
                        // this needs to be correct
                        height: 210,
                        child: ListView(
                          children: List.generate(5, (index) {
                            return buildColumnItem(context, index);
                          }),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
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
              )
            ],
          ),
        ),
      ),
    );
  }

  Row buildRowItem(BuildContext context, int index) {
    return Row(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.44,
          height: MediaQuery.of(context).size.height * 0.25,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            // color: Colors.green,
            image: DecorationImage(
              image: AssetImage(_imageList[index]),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.05,
        ),
      ],
    );
  }

  Column buildColumnItem(BuildContext context, int index) {
    return Column(
      children: [
        buildContainer(context, index),
        SizedBox(
          height: 15,
        ),
      ],
    );
  }

  Container buildContainer(BuildContext context, int index) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.11,
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Expanded(
            child: Container(
              // height:
              //     MediaQuery.of(context).size.height * 0.15,
              width: MediaQuery.of(context).size.width,
              // color: Colors.yellow,
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.18,
                    height: MediaQuery.of(context).size.height * 0.15,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      // color: Colors.red,
                      image: DecorationImage(
                        image: AssetImage(_imageList[index]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Container(
                      // width: MediaQuery.of(context).size.width * 0.2,
                      // height: MediaQuery.of(context).size.height * 0.1,
                      decoration: BoxDecoration(
                          // color: Colors.green,
                          ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'You are a miracle',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              letterSpacing: 1,
                            ),
                          ),
                          Text('Arvind Chadha'),
                          Text(
                            '\$20',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              letterSpacing: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
