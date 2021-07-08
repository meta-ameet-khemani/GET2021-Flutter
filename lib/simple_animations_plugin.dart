import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';

class SimpleAnimationPlugin extends StatelessWidget {
  const SimpleAnimationPlugin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView(controller: PageController(), children: [
      Center(
        child: PlayAnimation<double>(
          tween: 50.0.tweenTo(200),
          child: Center(
            child: Text('Simple Animation'),
          ),
          builder: (context, child, value) {
            return Container(
              color: Colors.blueAccent,
              width: value,
              height: value,
              child: child,
            );
          },
        ),
      ),
      Center(
        child: PlayAnimation<double>(
          tween: 50.0.tweenTo(200),
          delay: Duration(seconds: 3),
          child: Center(
            child: Text('Delayed Animation'),
          ),
          builder: (context, child, value) {
            return Container(
              color: Colors.blueAccent,
              width: value,
              height: value,
              child: child,
            );
          },
        ),
      ),
      Center(
        child: PlayAnimation<double>(
          tween: 50.0.tweenTo(200),
          duration: Duration(seconds: 3),
          child: Center(
            child: Text('Slow Animation'),
          ),
          builder: (context, child, value) {
            return Container(
              color: Colors.blueAccent,
              width: value,
              height: value,
              child: child,
            );
          },
        ),
      ),
      Center(
        child: PlayAnimation<double>(
          tween: 50.0.tweenTo(200),
          curve: Curves.bounceInOut,
          child: Center(
            child: Text('Curved Animation'),
          ),
          builder: (context, child, value) {
            return Container(
              color: Colors.blueAccent,
              width: value,
              height: value,
              child: child,
            );
          },
        ),
      ),
      Center(
        child: LoopAnimation<double>(
          tween: 10.0.tweenTo(50),
          duration: Duration(seconds: 3),
          builder: (context, child, value) {
            return Container(
              child: Center(
                child: Text(
                  'Loop Animation',
                  style: TextStyle(
                    fontSize: value,
                  ),
                ),
              ),
            );
          },
        ),
      ),
      Center(
        child: MirrorAnimation<double>(
          tween: (-100.0).tweenTo(100.0),
          duration: Duration(seconds: 3),
          builder: (context, child, value) {
            return Transform.translate(
              offset: Offset(0, value),
              child: Container(
                width: 90,
                height: 90,
                color: Colors.blueAccent,
              ),
            );
          },
        ),
      ),
      Center(
        child: CustomAnimation<double>(
          control: CustomAnimationControl.MIRROR,
          tween: 100.0.tweenTo(200.0),
          duration: 2.seconds,
          delay: 1.seconds,
          curve: Curves.easeInOut,
          child: Center(
            child: Text(
              "Hello!",
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          startPosition: 0.5,
          animationStatusListener: (status) {
            print("status updated: $status");
          },
          builder: (context, child, value) {
            return Container(
                width: value, height: value, color: Colors.blue, child: child);
          },
        ),
      ),
    ]);
  }
}
