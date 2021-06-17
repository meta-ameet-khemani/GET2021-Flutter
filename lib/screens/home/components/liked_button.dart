import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../util.dart';

class LikedButton extends StatelessWidget {
  const LikedButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      decoration: linkedWidgetDecoration,
      child: IconButton(
        icon: SvgPicture.asset('assets/icons/heart.svg'),
        onPressed: () {},
      ),
    );
  }
}
