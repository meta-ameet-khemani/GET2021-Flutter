import 'package:flutter/material.dart';
import 'package:http_practice/screen/add_product.dart';
import '../model/product_model.dart';
import '../widgets/product_item.dart';
import '../provider/product_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isInit = true;
  List<Product> _allProducts = [];

  @override
  void didChangeDependencies() {
    if (_isInit) {
      Future.delayed(Duration.zero).then((value) {
        print('fetching products');
        Provider.of<ProductProvider>(context).getAllProducts().then((value) {
          _allProducts = Provider.of<ProductProvider>(context).allProducts;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  Future<void> refreshProducts() async {
    await Provider.of<ProductProvider>(context).getAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Online Shop'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () =>
                Navigator.of(context).pushNamed(AddProduct.routeName),
          )
        ],
      ),
      body: Center(
        child: Provider.of<ProductProvider>(context).isLoaderActivated()
            ? CircularProgressIndicator()
            : RefreshIndicator(
                onRefresh: () => refreshProducts(),
                child: GridView.builder(
                  padding: const EdgeInsets.all(12),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // how many columns should be there
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    return ChangeNotifierProvider.value(
                      value: _allProducts[index],
                      child: ProductItem(),
                    );
                    // return ChangeNotifierProvider(
                    //   create: (ctx) => _allProducts[index],
                    //   child: ProductItem(),
                    // );
                  },
                  itemCount: _allProducts.length,
                ),
              ),
      ),
    );
  }
}
