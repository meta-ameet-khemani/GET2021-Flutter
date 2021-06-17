import 'package:flutter/material.dart';
import 'package:my_online_shop/widgets/cart_item.dart';
import 'package:provider/provider.dart';

import '../providers/cart_provider.dart';

class MyCart extends StatelessWidget {
  static const routeName = '/my-cart';

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final totalAmount = cartProvider.getTotalAmount();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Cart',
          // style: TextStyle(color: Theme.of(context).accentColor),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Card(
              margin: EdgeInsets.all(15),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total',
                      style: TextStyle(fontSize: 20),
                    ),
                    // SizedBox(
                    //   width: 10,
                    // ),
                    Spacer(),
                    Chip(
                      label: Text(
                        '$totalAmount',
                        style: TextStyle(
                          color:
                              Theme.of(context).primaryTextTheme.title!.color,
                        ),
                      ),
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                    FlatButton(
                      onPressed: () {},
                      child: Text('ORDER NOW'),
                      textColor: Theme.of(context).primaryColor,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: cartProvider.getAllCartItems.length,
                itemBuilder: (_, index) => CartItem(
                  id: cartProvider.getAllCartItems[index].id,
                  price: cartProvider.getAllCartItems[index].product.price,
                  quantity: cartProvider.getAllCartItems[index].quantity,
                  title: cartProvider.getAllCartItems[index].product.title,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
