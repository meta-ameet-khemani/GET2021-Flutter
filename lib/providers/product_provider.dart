import 'package:flutter/material.dart';
import 'package:my_online_shop/models/product.dart';
import '../temp_data/temp_products.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// creating a provider for product
class ProductProvider with ChangeNotifier {
  // bool _showFavoritesOnly = false;
  // List<Product> _products = dummyProducts;
  List<Product> _products = [];

  final String _productsLink =
      'https://flutterdemo-79b3f-default-rtdb.firebaseio.com/products.json';

  bool? isLoading = false;

  Future<void> getAllProducts() async {
    try {
      final allProducts = await http.get(Uri.parse(_productsLink));
      final allProductsDetail =
          json.decode(allProducts.body) as Map<String, dynamic>;
      final List<Product> finalProductList = [];
      allProductsDetail.forEach((key, value) {
        finalProductList.add(Product(
          id: key,
          title: value['title'],
          description: value['description'],
          price: value['price'],
          imageUrl: value['imageUrl'],
          isFavorite: false,
        ));
      });
      _products = finalProductList;
      notifyListeners();
    } catch (error) {
      print('error in fetching products');
      throw error;
    }
  }

  void setLoader({bool? showLoader}) {
    isLoading = showLoader;
    notifyListeners();
  }

  List<Product> get getProducts {
    // if (_showFavoritesOnly) {
    //   return _products.where((product) => product.isFavorite).toList();
    // }
    return _products;
  }

  Future<void> addProduct(
      {String? title,
      double? price,
      String? description,
      String? imageUrl}) async {
    try {
      final response = await http.post(
        Uri.parse(_productsLink),
        body: json.encode({
          'title': title,
          'description': description,
          'price': price,
          'imageUrl': imageUrl,
          'isFavorite': false,
        }),
      );

      print('response 1');
      Product addedProduct = Product(
        id: json.decode(response.body)['name'],
        title: title,
        description: description,
        price: price,
        imageUrl: imageUrl,
        isFavorite: false,
      );

      _products.add(addedProduct);
      // isLoading = false;
      notifyListeners();
    } catch (onError) {
      print(onError);
      throw onError;
    }

    // return http
    //     .post(_productsLink,
    //         body: json.encode({
    //           'title': title,
    //           'description': description,
    //           'price': price,
    //           'imageUrl': imageUrl,
    //           'isFavorite': false,
    //         }))
    //     .then((response) {
    //   print('response 1');
    //   Product addedProduct = Product(
    //     id: json.decode(response.body)['name'],
    //     title: title,
    //     description: description,
    //     price: price,
    //     imageUrl: imageUrl,
    //     isFavorite: false,
    //   );

    //   _products.add(addedProduct);
    //   // isLoading = false;
    //   notifyListeners();
    // }).catchError((onError) {
    //   print('error first');
    //   print(onError);
    //   throw onError;
    // });
  }

  Product getProductById(String? id) {
    return _products.firstWhere((product) => product.id == id);
  }

  List<Product> get getFavorites {
    return _products.where((product) => product.isFavorite).toList();
  }

  List<Product> get getAll {
    return _products;
  }

  // void showFavorites() {
  //   _showFavoritesOnly = true;
  //   notifyListeners();
  // }

  // void showAll() {
  //   _showFavoritesOnly = false;
  //   notifyListeners();
  // }
}
