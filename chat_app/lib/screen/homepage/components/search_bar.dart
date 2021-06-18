import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 40,
      decoration: BoxDecoration(
        color: Color(0xFFe9eaec),
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        controller: TextEditingController(),
        decoration: InputDecoration(
          border: InputBorder.none,
          icon: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Icon(Icons.search),
          ),
          hintText: 'Search',
        ),
      ),
    );
  }
}
