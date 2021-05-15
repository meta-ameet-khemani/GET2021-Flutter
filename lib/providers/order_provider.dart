import 'package:flutter/cupertino.dart';
import '../models/order.dart';

class OrderProvider with ChangeNotifier {
  final List<Order> _allOrders = [];

  List<Order> get getAllOrders => [..._allOrders];

  void addOrder(Order order) {
    _allOrders.add(order);
    notifyListeners();
  }
}
