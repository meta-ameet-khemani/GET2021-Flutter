import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/product_provider.dart';

class AddProduct extends StatefulWidget {
  static const routeName = 'add-product';

  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  String _title, _description, _imageUrl;
  double _price;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Product'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    gapPadding: 5,
                  ),
                  hintText: 'Name',
                  labelText: 'Enter Name',
                ),
                onChanged: (value) {
                  setState(() {
                    _title = value;
                  });
                },
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    gapPadding: 5,
                  ),
                  hintText: 'Price',
                  labelText: 'Enter Price',
                ),
                onChanged: (value) {
                  setState(() {
                    _price = double.parse(value);
                  });
                },
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
              child: TextField(
                minLines: 3,
                maxLines: 6,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    gapPadding: 5,
                  ),
                  hintText: 'Description',
                  labelText: 'Enter Description',
                ),
                onChanged: (value) {
                  setState(() {
                    _description = value;
                  });
                },
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    gapPadding: 5,
                  ),
                  hintText: 'Image URL',
                  labelText: 'Save Image link',
                ),
                onChanged: (value) {
                  setState(() {
                    _imageUrl = value;
                  });
                },
              ),
            ),
            Container(
              width: 200,
              height: 40,
              child: RaisedButton(
                onPressed: () async {
                  Provider.of<ProductProvider>(context)
                      .setLoader(showLoader: true);
                  // Navigator.of(context).pop();

                  try {
                    await Provider.of<ProductProvider>(context).addProduct(
                      title: _title,
                      description: _description,
                      price: _price,
                      imageUrl: _imageUrl,
                    );
                  } catch (error) {
                    print('error');
                    print(error);
                    await showDialog(
                        context: context,
                        builder: (ctx) {
                          return AlertDialog(
                            title: Text('Error'),
                            actions: [
                              FloatingActionButton(
                                onPressed: () {
                                  Navigator.of(ctx).pop();
                                },
                                child: Text('Okay'),
                              )
                            ],
                          );
                        });
                  } finally {
                    print('success response');
                    Provider.of<ProductProvider>(context)
                        .setLoader(showLoader: false);
                    Navigator.of(context).pop();
                  }
                },
                color: Theme.of(context).primaryColor,
                child: Text(
                  'Save',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
