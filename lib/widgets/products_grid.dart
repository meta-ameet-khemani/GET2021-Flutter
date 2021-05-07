import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'product_item.dart';
import '../providers/product_provider.dart';

class ProductsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // listening any changes
    final productProvider = Provider.of<ProductProvider>(context);

    // getting all (updated) products from product provider
    final allProducts = productProvider.getProducts;

    return GridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // how many columns should be there
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        return ChangeNotifierProvider.value(
          value: allProducts[index],
          child: ProductItem(),
        );
        // return ChangeNotifierProvider(
        //   create: (ctx) => allProducts[index],
        //   child: ProductItem(),
        // );
      },
      itemCount: allProducts.length,
    );
  }
}
