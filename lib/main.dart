import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    return ChangeNotifierProvider(
      create: (context) => ProductProvider(),
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
        },
        home: AllProducts(),
      ),
    );
  }
}
