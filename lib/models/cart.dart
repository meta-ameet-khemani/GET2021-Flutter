import 'product.dart';

class Cart {
  String id;
  Product product;
  int quantity;

  Cart({required this.id, required this.product, required this.quantity});
}
