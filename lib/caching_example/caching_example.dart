import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/file.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class CachingExample extends StatefulWidget {
  @override
  _CachingExampleState createState() => _CachingExampleState();
}

class _CachingExampleState extends State<CachingExample> {
  String _url =
      'https://firebasestorage.googleapis.com/v0/b/filledstacks.appspot.com/o/filledstacks_tutorials.pdf?alt=media&token=a5e671e7-5acd-4bc4-a167-8d8483954d2a';
  String _status = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Center(
        child: Column(
          children: [
            Text(
              '$_status',
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: CachedNetworkImage(
                imageUrl:
                    "https://wonderfulengineering.com/wp-content/uploads/2016/02/wallpapers-download-1-768x432.jpg",
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: CachedNetworkImage(
                imageUrl:
                    "https://wonderfulengineering.com/wp-content/uploads/2016/02/wallpapers-download-1-610x343.jpeg",
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    CircularProgressIndicator(value: downloadProgress.progress),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Image.network(
                  "https://wonderfulengineering.com/wp-content/uploads/2016/02/wallpapers-download-1-610x343.jpeg",
                ),
              ),
            ),
          ],
        ),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          setState(() {
            _status = 'Downloading';
          });
          File file = await MyCacheManager().getSingleFile(_url);
          setState(() {
            _status = 'Fetched ${file.path}';
          });
        },
        tooltip: 'Get File',
        child: Icon(Icons.download),
      ),
    );
  }
}

class MyCacheManager extends CacheManager {
  static MyCacheManager _instance;

  MyCacheManager._(Config config) : super(config);

  factory MyCacheManager() {
    if (_instance == null) {
      final config = Config(
        'testCache',
        stalePeriod: Duration(seconds: 10),
      );
      return MyCacheManager._(config);
    }
    return _instance;
  }
}
