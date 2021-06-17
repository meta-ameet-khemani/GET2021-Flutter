import 'package:flutter/material.dart';

class HomepageHeader extends StatefulWidget {
  final AnimationController? animationController;
  HomepageHeader({this.animationController});
  @override
  _HomepageHeaderState createState() => _HomepageHeaderState();
}

class _HomepageHeaderState extends State<HomepageHeader> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: 350,
              child: Image.asset(
                'assets/images/beach.jpg',
                fit: BoxFit.cover,
              ),
            ),
            TweenAnimationBuilder(
              tween: Tween<double>(begin: 0, end: 1),
              curve: Curves.bounceInOut,
              duration: Duration(
                seconds: 2,
              ),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  'Goa Beach',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // color: Colors.yellowAccent,
              ),
              builder: (context, dynamic value, Widget? child) {
                return Opacity(
                  opacity: value,
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: value * 300,
                    ),
                    child: child,
                  ),
                );
              },
            ),
            // FadeTransition(
            //   opacity: _animation,
            //   child: Align(
            //     alignment: Alignment.bottomLeft,
            //     child: Container(
            //       padding: EdgeInsets.fromLTRB(0, 300, 0, 0),
            //       child: Text(
            //         'Goa Beach',
            //         style: TextStyle(
            //           fontSize: 30,
            //           color: Colors.black,
            //           fontWeight: FontWeight.bold,
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
        SizedBox(
          height: 15,
        ),
        SlideTransition(
          position: Tween<Offset>(
            begin: Offset(-1, 0),
            end: Offset.zero,
          ).animate(widget.animationController!),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              'Animations Demo',
              style: TextStyle(
                fontSize: 30,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
