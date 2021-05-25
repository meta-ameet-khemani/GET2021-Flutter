import 'package:flutter/material.dart';
import 'dart:convert';

class PhotosList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Photo List Example'),
        centerTitle: true,
      ),
      body: Container(
        child: FutureBuilder(
          future:
              DefaultAssetBundle.of(context).loadString('assets/photos.json'),
          builder: (context, snapshort) {
            if (snapshort.connectionState == ConnectionState.done) {
              if (snapshort.hasData) {
                final photos = json.decode(snapshort.data.toString());
                return ListView.builder(
                  itemCount: photos.length,
                  itemBuilder: (ctx, index) {
                    final photo = photos[index];
                    return Card(
                      child: ListTile(
                        leading: Text('${photo['index']}'),
                        title: Text('${photo['guid']}'),
                      ),
                    );
                  },
                );
              } else {
                return Center(
                  child: Text('Error: ${snapshort.error.toString()}'),
                );
              }
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
