import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../common/size_constants.dart';

import 'logo.dart';

class MovieAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.height *
            0.07, // ScreenUtil.statusBarHeight + Sizes.dimen_4,
        left: Sizes.dimen_16,
        right: Sizes.dimen_16,
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/svgs/menu.svg',
              height: 22,
            ),
          ),
          Expanded(
            child: Logo(
              height: 30,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              size: 25,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
