import 'package:flutter/material.dart';
import 'package:fourth_assignment/responsive.dart';
import '../image_list.dart';

class BooksToShow extends StatelessWidget {
  const BooksToShow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(
            5,
            (index) => buildRowItem(context, index),
          ),
        ),
      ),
    );
  }

  Row buildRowItem(BuildContext context, int index) {
    return Row(
      children: [
        Container(
          width: isLandscape(context)
              ? MediaQuery.of(context).size.width * 0.2
              : MediaQuery.of(context).size.width * 0.44,
          height: MediaQuery.of(context).size.height * 0.25,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            // color: Colors.green,
            image: DecorationImage(
              image: AssetImage(imageList[index]),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.05,
        ),
      ],
    );
  }
}
