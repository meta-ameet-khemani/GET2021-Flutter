import 'package:flutter/material.dart';
import 'package:my_online_shop/providers/product_provider.dart';
import 'package:provider/provider.dart';

class ProductItemDetails extends StatelessWidget {
  static final String productItemDetailsRouteName = '/product-details';

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments as String;
    final product =
        Provider.of<ProductProvider>(context).getProductById(productId);
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                product.imageUrl,
                fit: BoxFit
                    .cover, // to cover the full screen (little bit zoom in)
              ),
            ),
            SizedBox(height: 10),
            Text(
              '${product.price}',
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(10),
              width: double.infinity,
              child: Text(
                '${product.description} asf asdf sadfsadf safdasdf asdfsadfasfd sdf sdf',
                textAlign: TextAlign.center,
                softWrap: true, // goes to new line, if no space is available
              ),
            ),
          ],
        ),
      ),
    );
  }
}
