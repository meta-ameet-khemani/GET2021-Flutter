import 'package:flutter/foundation.dart';

class Post {
  final String id;
  final String title;
  final String body;

  Post({@required this.id, @required this.title, @required this.body});

  factory Post.fromJson(Map<String, dynamic> parsedJson) {
    return Post(
      id: parsedJson['id'] as String,
      title: parsedJson['title'] as String,
      body: parsedJson['body'] as String,
    );
  }
}
