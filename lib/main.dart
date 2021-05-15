import 'package:flutter/material.dart';
import 'package:my_online_shop/providers/order_provider.dart';
import 'package:my_online_shop/screens/add_product.dart';
import 'package:my_online_shop/screens/edit_product.dart';
import 'package:provider/provider.dart';

import 'screens/my_cart.dart';
import 'providers/cart_provider.dart';
import 'providers/product_provider.dart';
import 'screens/product_item_details.dart';
import 'screens/all_products.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Wrapping top most widget for product provider, so that all can listen for changes
    return MultiProvider(
      // we can have a really long list of providers here
      // it won't affect the performance of app
      // because it's listeners who re-builds app not providers
      providers: [
        ChangeNotifierProvider.value(value: ProductProvider()),
        ChangeNotifierProvider.value(value: CartProvider()),

        // recommended approach to list all providers is
        ChangeNotifierProvider(
          create: (_) => OrderProvider(),
        ),
      ],
      // context will have that thing which is supposed to be changed
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: Colors.purple, // main color
          accentColor: Colors.deepOrange, // second/accent color
          fontFamily: 'Lato',
        ),
        routes: {
          ProductItemDetails.productItemDetailsRouteName: (context) =>
              ProductItemDetails(),
          MyCart.routeName: (context) => MyCart(),
          AddProduct.routeName: (context) => AddProduct(),
          EditProduct.routeName: (context) => EditProduct(),
        },
        home: AllProducts(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
