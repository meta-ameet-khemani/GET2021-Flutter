import 'package:flutter/material.dart';
import '../themes/app_color.dart';

class Separator extends StatelessWidget {
  final String text;

  const Separator({required this.text});

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = TextStyle();
    final Size txtSize = _textSize(text, textStyle);
    return Container(
      height: 2,
      width: (txtSize.width * 1.15),
      padding: EdgeInsets.only(
        top: 2,
        bottom: 10,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(1)),
        gradient: LinearGradient(
          colors: [
            AppColor.violet,
            AppColor.royalBlue,
          ],
        ),
      ),
    );
  }

  Size _textSize(String text, TextStyle style) {
    final TextPainter textPainter = TextPainter(
        text: TextSpan(text: text, style: style),
        maxLines: 1,
        textDirection: TextDirection.ltr)
      ..layout(minWidth: 0, maxWidth: double.infinity);
    return textPainter.size;
  }
}
