import 'package:flutter/material.dart';
import 'package:http_practice/model/product_model.dart';
import '../provider/product_provider.dart';
import 'package:provider/provider.dart';

class AddProduct extends StatefulWidget {
  static const routeName = 'add-product';

  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  String? _title, _description, _imageUrl;
  // double _price;
  bool _isEdit = false;
  TextEditingController? _titleController;
  TextEditingController? _priceController;
  TextEditingController? _descriptionController;
  TextEditingController? _imageUrlController;
  String? _id;

  void setTextField(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    if (args == null) {
      _titleController = TextEditingController();
      _priceController = TextEditingController();
      _descriptionController = TextEditingController();
      _imageUrlController = TextEditingController();
    } else {
      _isEdit = true;
      _id = args['id'];
      _titleController = TextEditingController(text: args['title']);
      _priceController = TextEditingController(text: args['price'].toString());
      _descriptionController = TextEditingController(text: args['description']);
      _imageUrlController = TextEditingController(text: args['imageUrl']);
    }
  }

  @override
  Widget build(BuildContext context) {
    setTextField(context);
    final _productProvider = Provider.of<ProductProvider>(context);
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    // final scaffold = Scaffold.of(context);
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Add Product'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              Icons.delete,
              color: Colors.red,
            ),
            onPressed: () async {
              try {
                Navigator.of(context).pop();
                _productProvider.showLoader(true);
                await _productProvider.deleteProduct(_id!);
                _productProvider.showLoader(false);
              } catch (error) {
                // showDialog(
                //   context: context,
                //   builder: (ctx) {
                //     return AlertDialog(
                //       title: Text('Can not delete'),
                //       content: Text('Error in deleting iteme'),
                //       actions: [
                //         FloatingActionButton(
                //           onPressed: () {
                //             Navigator.of(context).pop();
                //           },
                //           child: Text('Ok'),
                //         )
                //       ],
                //     );
                //   },
                // );
                // scaffold.showSnackBar(
                //   SnackBar(
                //     content: Text('can not delete'),
                //   ),
                // );
              }
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
              child: TextField(
                controller: _titleController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    gapPadding: 5,
                  ),
                  hintText: 'Name',
                  labelText: 'Enter Name',
                ),
                // onChanged: (value) {
                //   print(value);
                //   setState(() {
                //     _title = value;
                //   });
                // },
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
              child: TextField(
                controller: _priceController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    gapPadding: 5,
                  ),
                  hintText: 'Price',
                  labelText: 'Enter Price',
                ),
                // onChanged: (value) {
                //   setState(() {
                //     _price = double.parse(value);
                //   });
                // },
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
              child: TextField(
                controller: _descriptionController,
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
                // onChanged: (value) {
                //   setState(() {
                //     _description = value;
                //   });
                // },
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
              child: TextField(
                controller: _imageUrlController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    gapPadding: 5,
                  ),
                  hintText: 'Image URL',
                  labelText: 'Save Image link',
                ),
                // onChanged: (value) {
                //   setState(() {
                //     _imageUrl = value;
                //   });
                // },
              ),
            ),
            Container(
              width: 200,
              height: 40,
              child: RaisedButton(
                onPressed: () async {
                  final titleToUpdate = _titleController!.text;
                  final priceToUpdate = _priceController!.text;
                  final descriptionToUpdate = _descriptionController!.text;
                  final imageUrlToUpdate = _imageUrlController!.text;

                  if (_isEdit) {
                    print('if');
                    Navigator.of(context).pop();
                    _productProvider.showLoader(true);
                    try {
                      await _productProvider.updateProduct(
                        Product(
                          id: _id!,
                          title: titleToUpdate,
                          description: descriptionToUpdate,
                          price: double.parse(priceToUpdate),
                          imageUrl: imageUrlToUpdate,
                        ),
                      );
                      _productProvider.showLoader(false);
                    } catch (error) {
                      _productProvider.showLoader(false);
                      return showDialog(
                        context: context,
                        builder: (ctx) {
                          return AlertDialog(
                            title: Text('Error'),
                            content: Text('Can not update'),
                            actions: [
                              FloatingActionButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('Ok'),
                              )
                            ],
                          );
                        },
                      );
                    }
                  } else {
                    print('else');
                    Navigator.of(context).pop();
                    _productProvider.showLoader(true);
                    try {
                      await _productProvider.addProduct(
                        title: _titleController!.text,
                        description: _descriptionController!.text,
                        price: 123.2,
                        imageUrl: _imageUrlController!.text,
                      );
                      _productProvider.showLoader(false);
                    } catch (error) {
                      _productProvider.showLoader(false);

                      await showDialog(
                        context: _scaffoldKey.currentContext!,
                        builder: (ctx) => AlertDialog(
                          title: Text('An error occurred!'),
                          content: Text('Something went wrong.'),
                          actions: <Widget>[
                            FlatButton(
                              child: Text('Okay'),
                              onPressed: () {
                                Navigator.of(ctx).pop();
                              },
                            )
                          ],
                        ),
                      );
                    }
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
