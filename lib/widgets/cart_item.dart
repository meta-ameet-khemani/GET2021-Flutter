import 'package:flutter/material.dart';
import 'package:my_online_shop/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class CartItem extends StatelessWidget {
  final String id;
  final String title;
  final double price;
  final int quantity;

  CartItem({this.id, this.title, this.price, this.quantity});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Dismissible(
      key: ValueKey(id),
      direction: DismissDirection.endToStart, // dismiss only from right to left
      onDismissed: (dismissDirection) {
        cartProvider.removeItem(id);
      },
      background: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
        child: Container(
          color: Theme.of(context).errorColor,
          child: Icon(
            Icons.delete,
            size: 40,
            color: Colors.white,
          ),
          alignment: Alignment.centerRight,
          padding: EdgeInsets.only(right: 20),
          margin: EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 4,
          ),
        ),
      ),
      child: Card(
        margin: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: CircleAvatar(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: FittedBox(child: Text('$price')),
              ),
            ),
            title: Text('$title'),
            subtitle: Text('Total ${(price * quantity)} Rs'),
            trailing: Text('$quantity x'),
          ),
        ),
      ),
    );
  }
}
