import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants.dart';

class DaysChooser extends StatefulWidget {
  const DaysChooser({
    Key? key,
  }) : super(key: key);

  @override
  _DaysChooserState createState() => _DaysChooserState();
}

class _DaysChooserState extends State<DaysChooser> {
  int days = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 100,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: kInputBackgroundColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              StepperButton(
                title: '-',
                tapBack: () {
                  setState(() {
                    if (days > 1) {
                      days -= 1;
                    }
                  });
                },
              ),
              Text(
                days.toString(),
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              StepperButton(
                title: '+',
                tapBack: () {
                  setState(() {
                    days += 1;
                  });
                },
              ),
            ],
          ),
        ),
        SizedBox(
          width: 20,
        ),
        SvgPicture.asset(
          'assets/icons/timer.svg',
          width: 16,
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          days.toString(),
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          'Days',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}

class StepperButton extends StatelessWidget {
  final GestureTapCallback tapBack;
  final String title;

  const StepperButton({Key? key, required this.tapBack, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: tapBack,
      child: Container(
        width: 30,
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: kPrimaryColor,
        ),
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
