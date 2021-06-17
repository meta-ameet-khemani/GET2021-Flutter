import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  final GestureTapCallback back;
  const CustomBackButton({Key? key, required this.back}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.arrow_back,
        color: Colors.black,
      ),
      onPressed: back,
    );
  }
}
