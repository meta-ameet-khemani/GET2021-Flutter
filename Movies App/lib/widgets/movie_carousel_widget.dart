import 'package:flutter/material.dart';
import '../providers/movie_backdrop_provider.dart';
import 'package:provider/provider.dart';
import '../domain/entity/movie_entity.dart';
import 'movie_app_bar.dart';
import 'movie_backdrop_widget.dart';
import 'movie_page_view.dart';
import 'movie_title.dart';
import 'separator.dart';

class MovieCarouselWidget extends StatefulWidget {
  final List<MovieEntity> movies;
  final int defaultIndex;

  const MovieCarouselWidget({required this.movies, required this.defaultIndex});

  @override
  _MovieCarouselWidgetState createState() => _MovieCarouselWidgetState();
}

class _MovieCarouselWidgetState extends State<MovieCarouselWidget> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Consumer<MovieBackdropProvider>(
          builder:
              (context, MovieBackdropProvider movieBackdropProvider, child) {
            return MovieBackdropWidget(
              posterPath:
                  widget.movies[movieBackdropProvider.getIndex].posterPath,
            );
          },
        ),
        Column(
          children: [
            MovieAppBar(),
            MoviePageView(
              movies: widget.movies,
              initialPage: widget.defaultIndex,
            ),
            MovieTitle(movies: widget.movies),
            SizedBox(
              height: 5,
            ),
            Consumer<MovieBackdropProvider>(
              builder: (context, MovieBackdropProvider movieBackdropProvider,
                  child) {
                return Separator(
                    text: widget.movies[movieBackdropProvider.getIndex].title);
              },
            )
          ],
        ),
      ],
    );
  }
}
