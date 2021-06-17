import 'package:flutter/material.dart';

class UseAvatar extends StatelessWidget {
  const UseAvatar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: ClipOval(
        child: Image.asset('assets/images/avatar.png'),
      ),
      onPressed: () {},
    );
  }
}
