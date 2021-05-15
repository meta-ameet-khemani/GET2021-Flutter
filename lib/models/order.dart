import 'product.dart';

class Order {
  final String id;
  final List<Product> products;
  final double totalPrice;

  Order({this.id, this.products, this.totalPrice});
}
