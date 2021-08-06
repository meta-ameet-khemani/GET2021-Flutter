import 'dart:async';

import 'package:flutter/material.dart';

class Story extends StatefulWidget {
  final String? imageUrl;

  Story({this.imageUrl});

  @override
  _StoryState createState() => _StoryState();
}

class _StoryState extends State<Story> {
  double _storyTime = 0;

  @override
  void initState() {
    super.initState();
    _storyTime = 0;
    _changeTime();
  }

  void _changeTime() {
    Timer.periodic(Duration(milliseconds: 1), (timer) {
      if (this.mounted) {
        setState(() {
          _storyTime += 0.0025;
        });
      }
      if (_storyTime >= 1) {
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Material(
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Image.network(
                  this.widget.imageUrl!,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 30),
                child: InkWell(
                  onTap: () => Navigator.of(context).pop(),
                  child: Icon(
                    Icons.chevron_left,
                    size: 40,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        LinearProgressIndicator(
          minHeight: 6,
          backgroundColor: Colors.black,
          value: _storyTime,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      ],
    );
  }
}
