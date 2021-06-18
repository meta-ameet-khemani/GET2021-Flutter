import 'package:flutter/material.dart';
import 'package:fourth_assignment/responsive.dart';

class BookItemDetails extends StatefulWidget {
  final String image;
  BookItemDetails(this.image);
  @override
  _BookItemDetailsState createState() => _BookItemDetailsState();
}

class _BookItemDetailsState extends State<BookItemDetails>
    with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 3,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final List<Tab> myTabs = <Tab>[
    //   Tab(
    //     child: Align(
    //       alignment: Alignment.centerLeft,
    //       child: Text(
    //         'Description',
    //         style: TextStyle(
    //           color: Colors.black,
    //         ),
    //       ),
    //     ),
    //   ),
    //   Tab(
    //     child: Text(
    //       'Reviews (20)',
    //       style: TextStyle(
    //         color: Colors.black,
    //       ),
    //     ),
    //   ),
    //   Tab(
    //     child: Text(
    //       'Similliar',
    //       style: TextStyle(
    //         color: Colors.black,
    //       ),
    //     ),
    //   ),
    // ];
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.red[200],
      //   shadowColor: Colors.transparent,
      // ),
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          Hero(
            tag: widget.image,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.5,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.red[200],
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Text('asdf'),
                        Material(
                          color: Colors.red[200],
                          child: IconButton(
                            icon: Icon(
                              Icons.chevron_left,
                              size: 35,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ),
                      ],
                    ),
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.07,
                      left: 5,
                    ),
                  ),
                  Container(
                    height: isLandscape(context)
                        ? MediaQuery.of(context).size.height
                        : MediaQuery.of(context).size.height * 0.25,
                    width: MediaQuery.of(context).size.width * 0.4,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(widget.image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Container(
          //   height: MediaQuery.of(context).size.height * 0.5,
          //   child: Padding(
          //     padding: const EdgeInsets.all(12.0),
          //     child: Column(
          //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         Text(
          //           'You are a miracle',
          //           style: TextStyle(
          //             fontSize: 25,
          //             fontWeight: FontWeight.bold,
          //             letterSpacing: 1,
          //           ),
          //         ),
          //         Text('Arvind Chadha'),
          //         Row(
          //           children: [
          //             Baseline(
          //               baseline: -8,
          //               baselineType: TextBaseline.alphabetic,
          //               child: Text(
          //                 '\$',
          //                 style: TextStyle(
          //                   // fontSize: 30,
          //                   color: Colors.red[200],
          //                   fontWeight: FontWeight.bold,
          //                 ),
          //               ),
          //             ),
          //             Text(
          //               '20',
          //               style: TextStyle(
          //                 fontSize: 30,
          //                 fontWeight: FontWeight.bold,
          //                 letterSpacing: 1,
          //                 color: Colors.red[200],
          //               ),
          //             ),
          //           ],
          //         ),
          //         Column(
          //           children: [
          //             TabBar(
          //               indicatorSize: TabBarIndicatorSize.label,
          //               controller: _tabController,
          //               tabs: myTabs,
          //               indicatorColor: Colors.black,
          //             ),
          //             Container(
          //               height: MediaQuery.of(context).size.height * 0.2,
          //               // color: Colors.yellow[100],
          //               child: TabBarView(
          //                 controller: _tabController,
          //                 children: myTabs.map((Tab tab) {
          //                   return Center(
          //                     child: Text(
          //                       'Hi everyone, I am   @Abdul Aziz Ahwan . In this video, we are going to learn Flutter from basic with best practice. Which we are going to create a Modern Book App UI Design Uplabs. In this section, we will implement many widgets and concepts, such as Stack, Flutter SVG, Navigator, and  Google Fonts,  Custom Widget, and much more.',
          //                       style: const TextStyle(
          //                         fontSize: 15,
          //                       ),
          //                     ),
          //                   );
          //                 }).toList(),
          //               ),
          //             ),
          //           ],
          //         ),
          //         Container(
          //           width: double.infinity,
          //           child: RaisedButton(
          //             shape: RoundedRectangleBorder(
          //               borderRadius: BorderRadius.circular(8),
          //             ),
          //             color: Colors.red[200],
          //             onPressed: () {},
          //             child: Text(
          //               'Add to Library',
          //               style: TextStyle(
          //                 color: Colors.white,
          //               ),
          //             ),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
