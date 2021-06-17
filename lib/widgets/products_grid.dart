import 'package:flutter/material.dart';
import 'package:my_online_shop/models/product.dart';
import 'package:my_online_shop/screens/edit_product.dart';
import 'package:provider/provider.dart';

import 'product_item.dart';
import '../providers/product_provider.dart';

class ProductsGrid extends StatelessWidget {
  final bool showFavoritesOnly;
  late int indexx;

  ProductsGrid(this.showFavoritesOnly);

  @override
  Widget build(BuildContext context) {
    // listening any changes
    final productProvider = Provider.of<ProductProvider>(context);

    // getting all (updated) products from product provider
    // final allProducts = productProvider.getProducts;

    List<Product> allProducts;

    if (showFavoritesOnly) {
      allProducts = productProvider.getFavorites;
    } else {
      allProducts = productProvider.getAll;
    }

    return productProvider.isLoading!
        ? Center(
            child: CircularProgressIndicator(),
          )
        : GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(EditProduct.routeName,
                  arguments: allProducts[indexx].id);
            },
            child: GridView.builder(
              padding: const EdgeInsets.all(12),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // how many columns should be there
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                indexx = index;
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
            ),
          );
  }
}
