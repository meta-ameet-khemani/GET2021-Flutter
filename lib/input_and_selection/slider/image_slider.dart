import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class MyImageSlider extends StatefulWidget {
  @override
  _MySliderState createState() => _MySliderState();
}

class _MySliderState extends State<MyImageSlider> {
  int _imageIndex = -1;
  final _imagesList = [
    'https://images.unsplash.com/photo-1615474634824-f45fb12b24a8?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80',
    'https://images.unsplash.com/photo-1598131318520-b8e5b2d1349f?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80',
    'https://images.unsplash.com/photo-1532586733327-54ac07aa1154?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=751&q=80',
    'https://images.unsplash.com/photo-1532501429283-1451ab70c7fe?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80',
    'https://images.unsplash.com/photo-1530947443747-bcaaacd048d0?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=801&q=80'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      alignment: Alignment.center,
      child: Column(
        children: [
          Text(
            'Image Slider Example',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(5),
            alignment: Alignment.center,
            constraints: BoxConstraints.expand(
              height: 300,
            ),
            child: Swiper(
              autoplayDelay: 2,
              viewportFraction: 0.5,
              scale: 0.5,
              autoplay: false,
              itemCount: 5,
              itemBuilder: (context, index) {
                return Image.network(
                  _imagesList[index],
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
          // imageSlider(context),
        ],
      ),
    );
  }
}
