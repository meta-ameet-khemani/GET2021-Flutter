import 'package:flutter/material.dart';
import 'package:my_online_shop/providers/product_provider.dart';
import 'package:my_online_shop/screens/add_product.dart';
import 'package:provider/provider.dart';

import '../screens/my_cart.dart';
import '../widgets/badge.dart';

// import '../models/cart.dart';
import '../providers/cart_provider.dart';
import '../widgets/products_grid.dart';

enum ProductsCategory { ALL, FAVORITE }

class AllProducts extends StatefulWidget {
  @override
  _AllProductsState createState() => _AllProductsState();
}

class _AllProductsState extends State<AllProducts> {
  bool _showFavoritesOnly = false;
  bool _productsLoaded = true;
  bool _isLoadingProducts = false;

  @override
  void didChangeDependencies() {
    if (_productsLoaded) {
      print('didChangeDependencies');
      setState(() {
        _isLoadingProducts = true;
      });
      Provider.of<ProductProvider>(context).getAllProducts().then((_) {
        setState(() {
          print('loader is showing');
          _isLoadingProducts = false;
        });
      });
    }
    _productsLoaded = false;
    super.didChangeDependencies();
  }

  Future<void> _refreshPage(BuildContext context) async {
    await Provider.of<ProductProvider>(context).getAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    // This should not be here because this will affect all other places also where product list
    // is getting rendered. So we should make this to work only in this widget

    // final productProvider = Provider.of<ProductProvider>(context);
    // final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('My Online Shop'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            tooltip: 'Add Product',
            onPressed: () =>
                Navigator.of(context).pushNamed(AddProduct.routeName),
          ),
          PopupMenuButton(
            onSelected: (selectedCategory) {
              // if (selectedCategory == ProductsCategory.ALL) {
              //   productProvider.showAll();
              // } else {
              //   productProvider.showFavorites();
              // }

              setState(() {
                if (selectedCategory == ProductsCategory.ALL) {
                  _showFavoritesOnly = false;
                } else {
                  _showFavoritesOnly = true;
                }
              });
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
          Consumer<CartProvider>(
            builder: (_, cartProvider, ch) => Badge(
              child: ch,
              value: cartProvider.totalCountCartItem.toString(),
            ),
            child: IconButton(
              icon: Icon(
                Icons.shopping_cart,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(MyCart.routeName);
              },
            ),
          ),
        ],
      ),
      body: _isLoadingProducts
          ? Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.yellow,
              ),
            )
          : RefreshIndicator(
              onRefresh: () => _refreshPage(context),
              child: ProductsGrid(_showFavoritesOnly),
            ),
    );
  }
}
