import 'package:flutter/material.dart';

class InteractiveViewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 250,
      child: InteractiveViewer(
        child: Image.asset('assets/images/profile.jpg'),
      ),
    );
  }
}
