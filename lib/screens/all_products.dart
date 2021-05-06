import 'package:flutter/material.dart';
import 'package:my_online_shop/widgets/products_grid.dart';

class AllProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Online Shop'),
      ),
      body: ProductsGrid(),
    );
  }
}
