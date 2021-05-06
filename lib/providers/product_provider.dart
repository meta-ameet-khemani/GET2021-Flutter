import 'package:flutter/material.dart';
import 'package:my_online_shop/models/product.dart';
import '../temp_data/temp_products.dart';

// creating a provider for product
class ProductProvider with ChangeNotifier {
  List<Product> _products = dummyProducts;

  List<Product> get getProducts {
    return _products;
  }

  void addProduct() {
    _products.add(_products[0]);

    // notify all listeners to re-build
    notifyListeners();
  }

  Product getProductById(String id) {
    return _products.firstWhere((product) => product.id == id);
  }
}
