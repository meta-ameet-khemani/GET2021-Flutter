import 'package:flutter/material.dart';
import '../domain/entity/movie_entity.dart';
import '../providers/movie_backdrop_provider.dart';
import 'package:provider/provider.dart';

class MovieTitle extends StatelessWidget {
  const MovieTitle({
    Key? key,
    required this.movies,
  }) : super(key: key);

  final List<MovieEntity> movies;

  @override
  Widget build(BuildContext context) {
    return Consumer<MovieBackdropProvider>(
      builder: (context, MovieBackdropProvider movieBackdropProvider, child) {
        return Container(
          margin: EdgeInsets.only(top: 8),
          child: Text(
            movies[movieBackdropProvider.getIndex].title,
            overflow: TextOverflow.fade,
            textAlign: TextAlign.center,
            maxLines: 1,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        );
      },
    );
  }
}
