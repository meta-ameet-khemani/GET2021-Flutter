import 'package:flutter/material.dart';

import 'movie_card.dart';

class AnimatedMovieCard extends StatelessWidget {
  final int index;
  final int movieId;
  final String posterPath;
  final PageController pageController;

  const AnimatedMovieCard({
    required this.index,
    required this.movieId,
    required this.posterPath,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: pageController,
      builder: (context, child) {
        double value = 1;
        if (pageController.position.haveDimensions) {
          value = pageController.page! - index;
          value = (1 - (value.abs() * 0.1)).clamp(0.0, 1.0);
          return Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: 230,
              height: Curves.easeIn.transform(value) *
                  MediaQuery.of(context).size.height *
                  0.35,
              child: child,
            ),
          );
        } else {
          return Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: 230,
              height:
                  Curves.easeIn.transform(index == 0 ? value : value * 0.5) *
                      MediaQuery.of(context).size.height *
                      0.35,
              child: child,
            ),
          );
        }
      },
      child: MovieCard(
        movieId: movieId,
        posterPath: posterPath,
      ),
    );
  }
}
