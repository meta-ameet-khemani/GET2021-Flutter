import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../models/api_constants.dart';

class MovieBackdropWidget extends StatelessWidget {
  final String posterPath;

  const MovieBackdropWidget({required this.posterPath});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      alignment: Alignment.topCenter,
      heightFactor: 0.7,
      child: ClipRRect(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(20),
        ),
        child: Stack(
          children: <Widget>[
            FractionallySizedBox(
              heightFactor: 1,
              widthFactor: 1,
              child: FractionallySizedBox(
                heightFactor: 1,
                widthFactor: 1,
                child: CachedNetworkImage(
                  imageUrl: '${ApiConstants.BASE_IMAGE_URL}$posterPath',
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 1,
                color: Colors.transparent,
              ),
            ),
          ],
        ),
      ),
    );
    // FractionallySizedBox(
    //   alignment: Alignment.topCenter,
    //   heightFactor: 0.7,
    //   child: Stack(
    //     children: [
    //       FractionallySizedBox(
    //         heightFactor: 1,
    //         widthFactor: 1,
    //         child: CachedNetworkImage(
    //           imageUrl: '${ApiConstants.BASE_IMAGE_URL}$posterPath',
    //           fit: BoxFit.fitHeight,
    //         ),
    //       ),
    //       BackdropFilter(
    //         filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
    //         child: Container(
    //           width: MediaQuery.of(context).size.width,
    //           height: 1,
    //           color: Colors.transparent,
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
