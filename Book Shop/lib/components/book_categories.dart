import 'package:flutter/material.dart';

class BookCategories extends StatefulWidget {
  @override
  _BookCategoriesState createState() => _BookCategoriesState();
}

class _BookCategoriesState extends State<BookCategories> {
  @override
  Widget build(BuildContext context) {
    int _currentCategoryIndex = 0;
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextButton(
            onPressed: () {
              setState(() {
                _currentCategoryIndex = 0;
              });
            },
            child: Text(
              'New',
              style: _currentCategoryIndex == 0
                  ? TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    )
                  : TextStyle(),
            ),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                _currentCategoryIndex = 1;
              });
            },
            child: Text(
              'Trending',
              style: _currentCategoryIndex == 1
                  ? TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    )
                  : TextStyle(),
            ),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                _currentCategoryIndex = 2;
              });
            },
            child: Text(
              'Best Seller',
              style: _currentCategoryIndex == 2
                  ? TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    )
                  : TextStyle(),
            ),
          ),
        ],
      ),
    );
  }
}
