import 'package:flutter/material.dart';

class MyHeroAnimation extends StatefulWidget {
  @override
  _MyHeroAnimationState createState() => _MyHeroAnimationState();
}

class _MyHeroAnimationState extends State<MyHeroAnimation> {
  final imageList = [
    'https://images.unsplash.com/photo-1542291026-7eec264c27ff?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8c2hvZXN8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1525966222134-fcfa99b8ae77?ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8c2hvZXN8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1460353581641-37baddab0fa2?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8c2hvZXN8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1449505278894-297fdb3edbc1?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTd8fHNob2VzfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
  ];

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Hero(
                  tag: '1',
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ShoeDetails(imageList[0], '1'),
                        ),
                      );
                    },
                    child: CircleAvatar(
                      minRadius: 10,
                      maxRadius: 50,
                      backgroundImage: NetworkImage(imageList[0]),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Hero(
                  tag: '2',
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ShoeDetails(imageList[1], '2'),
                        ),
                      );
                    },
                    child: CircleAvatar(
                      minRadius: 10,
                      maxRadius: 50,
                      backgroundImage: NetworkImage(imageList[1]),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Hero(
                  tag: '3',
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ShoeDetails(imageList[2], '3'),
                        ),
                      );
                    },
                    child: CircleAvatar(
                      minRadius: 10,
                      maxRadius: 50,
                      backgroundImage: NetworkImage(imageList[2]),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Hero(
                  tag: '4',
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ShoeDetails(imageList[3], '4'),
                        ),
                      );
                    },
                    child: CircleAvatar(
                      minRadius: 10,
                      maxRadius: 50,
                      backgroundImage: NetworkImage(imageList[3]),
                    ),
                  ),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Hero(
              //     tag: '4',
              //     child: GestureDetector(
              //       onTap: () {
              //         Navigator.push(
              //           context,
              //           PageRouteBuilder(
              //             pageBuilder: (context, _, __) {
              //               return Scaffold(
              //                 appBar: AppBar(
              //                   backgroundColor: Colors.transparent,
              //                 ),
              //                 extendBodyBehindAppBar: true,
              //                 body: Center(
              //                   child: Container(
              //                     child: Column(
              //                       children: [
              //                         Flexible(
              //                           flex: 2,
              //                           child: Container(
              //                             height: 750,
              //                             child: Image.network(
              //                               'https://images.unsplash.com/photo-1460353581641-37baddab0fa2?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8c2hvZXN8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
              //                               fit: BoxFit.fitHeight,
              //                             ),
              //                           ),
              //                         ),
              //                         Flexible(
              //                           flex: 1,
              //                           child: Container(
              //                             child: Text(
              //                               'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
              //                               style: TextStyle(
              //                                   fontSize: 25,
              //                                   fontWeight: FontWeight.bold),
              //                             ),
              //                           ),
              //                         ),
              //                       ],
              //                     ),
              //                   ),
              //                 ),
              //               );
              //             },
              //             transitionDuration: Duration(seconds: 3),
              //             transitionsBuilder:
              //                 (context, animation, secondaryAnimation, child) {
              //               return Align(
              //                 child: FadeTransition(
              //                   opacity: animation,
              //                   child: child,
              //                 ),
              //               );
              //             },
              //           ),
              //         );
              //       },
              //       child: CircleAvatar(
              //         minRadius: 10,
              //         maxRadius: 50,
              //         backgroundImage: NetworkImage(
              //             'https://images.unsplash.com/photo-1449505278894-297fdb3edbc1?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTd8fHNob2VzfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'),
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

class ShoeDetails extends StatelessWidget {
  final String imageURL;
  final String tag;

  ShoeDetails(this.imageURL, this.tag);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: Center(
        child: Container(
          child: Column(
            children: [
              Flexible(
                flex: 2,
                child: Container(
                  height: 750,
                  child: Hero(
                    tag: this.tag,
                    child: Image.network(
                      this.imageURL,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(
                  child: Text(
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
