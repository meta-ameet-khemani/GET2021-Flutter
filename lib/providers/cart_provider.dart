import 'package:flutter/cupertino.dart';

import '../models/product.dart';
import '../models/cart.dart';

class CartProvider with ChangeNotifier {
  List<Cart> _cartItems = [];

  List<Cart> get getAllCartItems => [..._cartItems];

  int get totalCountCartItem => _cartItems.length;

  void addItem({Product product}) {
    int index = _cartItems.indexWhere((item) => item.product.id == product.id);
    if (index >= 0) {
      _cartItems[index].quantity += 1;
    } else {
      _cartItems.add(
          Cart(id: DateTime.now().toString(), product: product, quantity: 1));
    }
    notifyListeners();
  }

  String getTotalAmount() {
    double total = 0.0;
    _cartItems.forEach((item) {
      total += item.product.price * item.quantity;
    });
    return total.toString();
  }

  void removeItem(String id) {
    _cartItems.removeWhere((item) => item.id == id);
    notifyListeners();
  }
}
