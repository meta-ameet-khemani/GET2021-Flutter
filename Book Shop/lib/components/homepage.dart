import 'package:flutter/material.dart';

import 'book_categories.dart';
import 'book_list.dart';
import 'books_to_show.dart';
import 'navigation_bar.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Hi, User'),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 15,
                          ),
                          child: Text(
                            'Discover Latest Book',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        searchBar(),
                        BookCategories(),
                        BooksToShow(),
                        Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Text(
                            'Popular',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        BooKItemList(),
                      ],
                    ),
                  ),
                ),
              ),
              NavigationBottomBar(),
            ],
          ),
        ),
      ),
    );
  }

  Padding searchBar() {
    return Padding(
      padding: EdgeInsets.only(
        top: 15,
      ),
      child: Container(
        height: 35,
        color: Colors.grey[200],
        child: TextFormField(
          decoration: InputDecoration(
            labelText: 'Search book ...',
            suffixIcon: Container(
              decoration: BoxDecoration(
                color: Colors.red[300],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}
