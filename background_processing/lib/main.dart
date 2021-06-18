import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder<List<Photo>>(
        future: fetchPhotos(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.hasError.toString()),
            );
          }
          return snapshot.hasData
              ? PhotosList(
                  photos: snapshot.data!,
                ) //photos: snapshot.data
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class PhotosList extends StatelessWidget {
  final List<Photo> photos;

  PhotosList({Key? key, required this.photos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(this.photos.length);
    return GridView.builder(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (context, index) {
        return Image.network(this.photos[index].thumbnailUrl);
      },
      itemCount: this.photos.length,
    );
  }
}

Future<List<Photo>> fetchPhotos(http.Client client) async {
  final response = await client
      .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));

  // Use the compute function to run parsePhotos in a separate isolate.
  // return compute(parsePhotos, response.body);
  final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
  List<Photo> a = parsed.map<Photo>((json) => Photo.fromJson(json)).toList();
  print('len = ${a.length}');
  return a;
}

// A function that converts a response body into a List<Photo>.
List<Photo> parsePhotos(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  List<Photo> a = parsed.map<Photo>((json) => Photo.fromJson(json)).toList();
  print('len = ${a.length}');
  return a;
}

// Future<List<Photo>> fetchPhotos(http.Client client) async {
//   final response = await client
//       .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
//   final decodedDataAsMap =
//       jsonDecode(response.body).cast<Map<String, String>>();
//   return decodedDataAsMap
//       .map((jsonPhoto) => Photo.fromJson(jsonPhoto))
//       .toList();
// }

class Photo {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  Photo({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      albumId: json['albumId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
      url: json['url'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String,
    );
  }
}
