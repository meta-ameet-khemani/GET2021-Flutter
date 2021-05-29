import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants.dart';

class NavItem extends StatelessWidget {
  final String icon;
  final bool isActive;

  const NavItem({
    Key key,
    @required this.icon,
    @required this.isActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Spacer(),
        IconButton(
          icon: SvgPicture.asset(icon),
          onPressed: () {},
        ),
        Spacer(),
        Container(
          height: 4,
          width: 35,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: isActive ? kPrimaryColor : Colors.transparent,
            boxShadow: [
              BoxShadow(
                blurRadius: 6,
                offset: const Offset(0, -2),
                color: isActive ? kPrimaryColor : Colors.transparent,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
