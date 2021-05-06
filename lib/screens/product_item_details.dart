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
    );
  }
}
