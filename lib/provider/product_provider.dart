import 'package:flutter/cupertino.dart';
import 'package:http_practice/exception/delete_exception.dart';
import '../model/product_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProductProvider with ChangeNotifier {
  bool toWait = false;
  List<Product> allProducts = [];
  final String _productsUrl =
      'https://flutterdemo-79b3f-default-rtdb.firebaseio.com/products.json';

  void showLoader(bool shouldWait) {
    toWait = shouldWait;
    notifyListeners();
  }

  bool isLoaderActivated() {
    return toWait;
  }

  Future<void> deleteProduct(String id) async {
    final String url =
        'https://flutterdemo-79b3f-default-rtdb.firebaseio.com/products/$id.json';
    final response = await http.delete(url);
    if (response.statusCode == 200) {
      int index = allProducts.indexWhere((product) => product.id == id);
      allProducts.removeAt(index);
      showLoader(false);
      notifyListeners();
    } else {
      throw MyDeleteException('Error in deleting');
    }
  }

  Future<void> updateProduct(Product product) async {
    final url =
        'https://flutterdemo-79b3f-default-rtdb.firebaseio.com/products/${product.id}.json';
    try {
      final response = await http.patch(
        url,
        body: json.encode({
          'title': product.title,
          'price': product.price,
          'description': product.description,
          'imageUrl': product.imageUrl,
        }),
      );
      print(response.statusCode);
      int indexToUpdate =
          allProducts.indexWhere((prod) => prod.id == product.id);
      if (indexToUpdate > -1) {
        allProducts[indexToUpdate].title = product.title;
        allProducts[indexToUpdate].price = product.price;
        allProducts[indexToUpdate].description = product.description;
        allProducts[indexToUpdate].imageUrl = product.imageUrl;
      }
      print(allProducts[indexToUpdate].title);
      notifyListeners();
    } catch (error) {
      print('error in updating product');
      throw error;
    }
  }

  Future<void> addProduct(
      {String title, double price, String description, String imageUrl}) async {
    try {
      final response = await http.post(
        _productsUrl,
        body: json.encode({
          'title': title,
          'price': price,
          'description': description,
          'imageUrl': imageUrl,
          'isFavorite': false,
        }),
      );

      final addedProductId = json.decode(response.body)['name'];
      allProducts.add(Product(
        id: addedProductId,
        description: description,
        imageUrl: imageUrl,
        price: price,
        title: title,
        isFavorite: false,
      ));
      notifyListeners();
      print(allProducts.length);
      // https://images.unsplash.com/photo-1560179304-6fc1d8749b23?ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDR8eGpQUjRobGtCR0F8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60
      // https://images.unsplash.com/photo-1618001789159-ffffe6f96ef2?ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8c2hpcnR8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60
      //https://images.unsplash.com/photo-1607345366928-199ea26cfe3e?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fHNoaXJ0fGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60
      //https://images.unsplash.com/photo-1563630423918-b58f07336ac9?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8c2hpcnR8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60
      //https://images.unsplash.com/photo-1588359348347-9bc6cbbb689e?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8c2hpcnR8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60
    } catch (error) {
      print('error is saving product');
      print(error);
      throw error;
    }
  }

  Future<void> getAllProducts() async {
    try {
      showLoader(true);
      final response = await http.get(
          'https://flutterdemo-79b3f-default-rtdb.firebaseio.com/products.json');
      final jsonResponse = json.decode(response.body) as Map<String, dynamic>;
      final List<Product> allProds = [];
      if (jsonResponse != null) {
        jsonResponse.forEach((productId, productData) {
          allProds.add(Product(
            id: productId,
            title: productData['title'],
            description: productData['description'],
            price: productData['price'],
            imageUrl: productData['imageUrl'],
          ));
        });
        print(allProds.length);
        allProducts = allProds;
      }
      showLoader(false);
      notifyListeners();
    } catch (error) {
      print('error in fetching products');
      throw error;
    }
  }
}
