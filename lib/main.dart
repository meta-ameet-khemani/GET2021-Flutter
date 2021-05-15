import 'package:flutter/material.dart';
import 'package:http_practice/screen/add_product.dart';
import 'provider/product_provider.dart';
import 'screen/homescreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProductProvider(),
        ),
      ],
      child: MaterialApp(
        routes: {
          AddProduct.routeName: (context) => AddProduct(),
        },
        home: Scaffold(
          // appBar: AppBar(
          //   title: Text('My Online Shop'),
          //   centerTitle: true,
          // ),
          body: HomeScreen(),
        ),
      ),
    );
  }
}
