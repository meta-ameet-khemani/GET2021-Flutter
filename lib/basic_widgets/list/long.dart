import 'package:flutter/material.dart';

class MyLongList extends StatelessWidget {
  List<String> products = List<String>.generate(500, (i) => "Product List: $i");

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('${products[index]}'),
        );
      },
    );
  }
}