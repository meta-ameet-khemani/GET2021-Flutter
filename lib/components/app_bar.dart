import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';

AppBar buildAppBar(
    {required BuildContext context,
    required String title,
    required List<Widget> actions,
    required Widget leading}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    title: Text(
      title,
      style: GoogleFonts.merriweather(
        color: kTextColor,
        fontSize: 27,
      ),
    ),
    leading: leading,
    actions: actions,
  );
}
