import 'package:flutter/material.dart';
import 'package:http_practice/screen/add_product.dart';
import '../model/product_model.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productItemProvider = Provider.of<Product>(context, listen: false);

    // print('complete product item rebuilds');
    return Scaffold(
      body: Center(
        child: ClipRRect(
          borderRadius:
              BorderRadius.circular(10), // setting corner of image to round
          child: GridTile(
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(
                  AddProduct.routeName,
                  arguments: {
                    'id': productItemProvider.id,
                    'title': productItemProvider.title,
                    'description': productItemProvider.description,
                    'price': productItemProvider.price,
                    'imageUrl': productItemProvider.imageUrl,
                  },
                );
              },
              child: Image.network(
                productItemProvider.imageUrl,
                fit: BoxFit.cover, // take all available space
              ),
            ),
            header: Text('asdf'),
            footer: GridTileBar(
              // Consumer is used to rebuild only small amount of part in complete widget
              // that can be acheived by efficiently using Provider.of in code for better optimization
              leading: Consumer<Product>(builder: (context, product, child) {
                // here child represents that part of Consumer which generally doesn't change
                // like label (if present) for Icon. As it remains constant always, so we could done like
                // child: Label('Favorite Icon) [if present]
                // print('only favorite icon rebuilds');
                return IconButton(
                  icon: productItemProvider.isSetFavorite
                      ? Icon(Icons.favorite)
                      : Icon(Icons.favorite_border),
                  onPressed: () {
                    product.toggleFavorite();
                  },
                  color: Theme.of(context).accentColor,
                );
              }),
              backgroundColor: Colors.black87,
              title: Text(
                productItemProvider.title,
                textAlign: TextAlign.center,
              ),
              trailing: IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  // cartProvider.addItem(product: productItemProvider);
                },
                color: Theme.of(context).accentColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
