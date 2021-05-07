import 'package:flutter/material.dart';
import 'package:my_online_shop/providers/product_provider.dart';
import 'package:provider/provider.dart';
import '../widgets/products_grid.dart';

enum ProductsCategory { ALL, FAVORITE }

class AllProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('My Online Shop'),
        actions: [
          PopupMenuButton(
            onSelected: (selectedCategory) {
              if (selectedCategory == ProductsCategory.ALL) {
                productProvider.showAll();
              } else {
                productProvider.showFavorites();
              }
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('All'),
                value: ProductsCategory.ALL,
              ),
              PopupMenuItem(
                child: Text('Favorites'),
                value: ProductsCategory.FAVORITE,
              ),
            ],
          ),
        ],
      ),
      body: ProductsGrid(),
    );
  }
}
