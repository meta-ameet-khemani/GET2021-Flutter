import 'package:flutter/material.dart';
import 'package:my_online_shop/models/product.dart';
import 'package:provider/provider.dart';
import '../screens/product_item_details.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    print('complete product item rebuilds');
    return ClipRRect(
      borderRadius:
          BorderRadius.circular(10), // setting corner of image to round
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductItemDetails.productItemDetailsRouteName,
              arguments: product.id,
            );
          },
          child: Image.network(
            product.imageUrl,
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
            print('only favorite icon rebuilds');
            return IconButton(
              icon: product.isSetFavorite
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
            product.title,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {},
            color: Theme.of(context).accentColor,
          ),
        ),
      ),
    );
  }
}
