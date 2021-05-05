import 'package:flutter/material.dart';
import '../screens/category_item.dart';
import '../temp_asset/dummy_category_items.dart';

class CategoryScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(15),
      children: DUMMY_CATEGORY_ITEM.map((catItem) =>
          CategoryItem(catItem.id, catItem.title, catItem.color)
      ).toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200, // space to be taken by each grid item
        childAspectRatio: 3 / 2, // space between children
        crossAxisSpacing: 20, // space between column and grid item
        mainAxisSpacing: 20, // space between row and grid item
      ),
    );
    // return Scaffold(
    //   appBar: AppBar(
    //     title: const Text('My Meal App'),
    //   ),
    //   body: Padding(
    //     padding: const EdgeInsets.all(15.0),
    //     child: GridView(
    //       children: DUMMY_CATEGORY_ITEM.map((catItem) =>
    //           CategoryItem(catItem.id, catItem.title, catItem.color)
    //       ).toList(),
    //       gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
    //         maxCrossAxisExtent: 200, // space to be taken by each grid item
    //         childAspectRatio: 3 / 2, // space between children
    //         crossAxisSpacing: 20, // space between column and grid item
    //         mainAxisSpacing: 20, // space between row and grid item
    //       ),
    //     ),
    //   ),
    // );
  }
}
