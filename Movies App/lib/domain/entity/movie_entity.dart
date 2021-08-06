import 'package:equatable/equatable.dart';

class MovieEntity extends Equatable {
  final String posterPath;
  final int id;
  final String backdropPath;
  final String title;
  final num voteAverge;
  final String releaseDate;
  final String overview;

  const MovieEntity({
    required this.posterPath,
    required this.id,
    required this.backdropPath,
    required this.title,
    required this.voteAverge,
    required this.releaseDate,
    required this.overview,
  });

  @override
  List<Object?> get props => [id, title];

  @override
  bool? get stringify => true;
}
