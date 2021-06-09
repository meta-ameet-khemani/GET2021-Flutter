import 'package:flutter/material.dart';
import 'package:fourth_assignment/responsive.dart';
import '../screen/book_item_details.dart';
import '../image_list.dart';

class BooKItemList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 4),
      child: Container(
        // this needs to be correct
        height: isLandscape(context)
            ? MediaQuery.of(context).size.height
            : MediaQuery.of(context).size.height * 0.26,
        child: ListView(
          children: List.generate(5, (index) {
            return buildColumnItem(context, index);
          }),
        ),
      ),
    );
  }

  Column buildColumnItem(BuildContext context, int index) {
    return Column(
      children: [
        buildContainer(context, index),
        SizedBox(
          height: 15,
        ),
      ],
    );
  }

  Container buildContainer(BuildContext context, int index) {
    return Container(
      height: isLandscape(context)
          ? MediaQuery.of(context).size.height * 0.3
          : MediaQuery.of(context).size.height * 0.11,
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Expanded(
            child: Container(
              // height: MediaQuery.of(context).size.height * 0.15,
              width: MediaQuery.of(context).size.width,
              // color: Colors.yellow,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              BookItemDetails(imageList[index]),
                        ),
                      );
                    },
                    child: Hero(
                      tag: imageList[index],
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.18,
                        height: isLandscape(context)
                            ? MediaQuery.of(context).size.height * 0.3
                            : MediaQuery.of(context).size.height * 0.15,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          // color: Colors.red,
                          image: DecorationImage(
                            image: AssetImage(imageList[index]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Container(
                      // width: MediaQuery.of(context).size.width * 0.2,
                      // height: MediaQuery.of(context).size.height * 0.1,
                      decoration: BoxDecoration(
                          // color: Colors.green,
                          ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              'You are a miracle',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                letterSpacing: 1,
                              ),
                            ),
                          ),
                          Expanded(child: Text('Arvind Chadha')),
                          Expanded(
                            child: Text(
                              '\$20',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                letterSpacing: 1,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
