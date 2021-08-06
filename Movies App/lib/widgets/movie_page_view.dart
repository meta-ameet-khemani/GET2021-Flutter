import 'package:flutter/material.dart';
import '../providers/movie_backdrop_provider.dart';
import 'package:provider/provider.dart';
import '../common/size_constants.dart';
import '../domain/entity/movie_entity.dart';
import 'animated_movie_card.dart';

class MoviePageView extends StatefulWidget {
  final List<MovieEntity> movies;
  final int initialPage;

  const MoviePageView({required this.movies, required this.initialPage});

  @override
  _MoviePageViewState createState() => _MoviePageViewState();
}

class _MoviePageViewState extends State<MoviePageView> {
  PageController? _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: widget.initialPage,
      keepPage: false,
      viewportFraction: 0.7,
    );
  }

  @override
  void dispose() {
    _pageController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: Sizes.dimen_10),
      height: MediaQuery.of(context).size.height * 0.35,
      child: PageView.builder(
        controller: _pageController,
        itemBuilder: (context, index) {
          final MovieEntity movieEntity = widget.movies[index];
          return AnimatedMovieCard(
            movieId: movieEntity.id,
            posterPath: movieEntity.posterPath,
            index: index,
            pageController: _pageController!,
          );
        },
        pageSnapping: true,
        itemCount: widget.movies.length,
        onPageChanged: (index) {
          Provider.of<MovieBackdropProvider>(context, listen: false)
              .setIndex(index);
        },
      ),
    );
  }
}
