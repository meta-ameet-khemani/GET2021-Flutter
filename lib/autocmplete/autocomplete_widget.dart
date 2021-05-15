import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AutocompleteWidget extends StatelessWidget {
  Future<void> getPosts() async {
    // json.decode(rootBundle.loadString('assets/posts.json'));
    List<Map<String, dynamic>> jsonString = (await rootBundle
        .loadString('assets/posts.json')) as List<Map<String, dynamic>>;
    // Map parsedJson = json.decode(jsonString);
    // print(jsonString[0]);
  }

  @override
  Widget build(BuildContext context) {
    getPosts();
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('AutoComplete Example'),
        ),
        body: Center(),
      ),
    );
  }
}
