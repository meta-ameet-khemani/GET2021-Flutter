import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../common/size_constants.dart';
import '../models/api_constants.dart';

class MovieCard extends StatelessWidget {
  final int movieId;
  final String posterPath;

  const MovieCard({required this.movieId, required this.posterPath});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 32,
      borderRadius: BorderRadius.circular(Sizes.dimen_16),
      child: GestureDetector(
        onTap: () {},
        child: ClipRRect(
          borderRadius: BorderRadius.circular(Sizes.dimen_16),
          child: CachedNetworkImage(
            imageUrl: '${ApiConstants.BASE_IMAGE_URL}$posterPath',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
