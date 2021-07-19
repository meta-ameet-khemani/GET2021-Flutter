import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class CachedNetworkImageWidget extends StatefulWidget {
  @override
  _CachedNetworkImageWidgetState createState() =>
      _CachedNetworkImageWidgetState();
}

class _CachedNetworkImageWidgetState extends State<CachedNetworkImageWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 7, vertical: 10),
        color: Colors.blue[100],
        child: ListView.builder(
          itemCount: 50,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                leading: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: CachedNetworkImage(
                      key: UniqueKey(),
                      imageUrl: "https://picsum.photos/150?image=$index",
                      placeholder: (context, url) =>
                          CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                    // Image.network('https://picsum.photos/150?image=$index'),
                  ),
                ),
                title: Text('Image Number ${index + 1}'),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('clicked');
          DefaultCacheManager().emptyCache();
          imageCache.clear();
          imageCache.clearLiveImages();
          setState(() {});
        },
        child: Icon(Icons.cached),
      ),
    );
    // Center(
    //   child: CachedNetworkImage(
    //     imageUrl: "https://picsum.photos/250?image=8",
    //     placeholder: (context, url) => CircularProgressIndicator(),
    //     errorWidget: (context, url, error) => Icon(Icons.error),
    //   ),
    // );
  }
}
