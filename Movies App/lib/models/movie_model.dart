import '../domain/entity/movie_entity.dart';

class MovieModel extends MovieEntity {
  final double voteAverage;
  final String overview;
  final String releaseDate;
  final bool? adult;
  final String backdropPath;
  final int? voteCount;
  final List<int>? genreIds;
  final int id;
  final String? originalLanguage;
  final String? originalTitle;
  final String posterPath;
  final String title;
  final bool? video;
  final double? popularity;
  final String? mediaType;
  final String? name;
  final String? firstAirDate;
  final List<String>? originCountry;
  final String? originalName;

  MovieModel(
      {required this.voteAverage,
      required this.overview,
      required this.releaseDate,
      required this.adult,
      required this.backdropPath,
      required this.voteCount,
      required this.genreIds,
      required this.id,
      required this.originalLanguage,
      required this.originalTitle,
      required this.posterPath,
      required this.title,
      required this.video,
      required this.popularity,
      required this.mediaType,
      required this.name,
      required this.firstAirDate,
      required this.originCountry,
      required this.originalName})
      : super(
          backdropPath: backdropPath,
          id: id,
          overview: overview,
          posterPath: posterPath,
          releaseDate: releaseDate,
          title: title,
          voteAverge: voteAverage,
        );

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      voteAverage: json['vote_average']?.toDouble() ?? 0.0,
      overview: json['overview'],
      releaseDate: json['release_date'],
      adult: json['adult'],
      backdropPath: json['backdrop_path'] == null ? '' : json['backdrop_path'],
      voteCount: json['vote_count'],
      genreIds: json['genre_ids'].cast<int>(),
      id: json['id'],
      originalLanguage: json['original_language'],
      originalTitle: json['original_title'],
      posterPath: json['poster_path'],
      title: json['title'],
      video: json['video'],
      popularity: json['popularity']?.toDouble() ?? 0.0,
      mediaType: json['media_type'] == null ? null : json['media_type'],
      name: json['name'] == null ? null : json['name'],
      firstAirDate:
          json['first_air_date'] == null ? null : json['first_air_date'],
      originCountry: json['origin_country']?.cast<String>() == null
          ? null
          : json['origin_country'],
      originalName:
          json['original_name'] == null ? null : json['original_name'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vote_average'] = this.voteAverage;
    data['overview'] = this.overview;
    data['release_date'] = this.releaseDate;
    data['adult'] = this.adult;
    data['backdrop_path'] = this.backdropPath;
    data['vote_count'] = this.voteCount;
    data['genre_ids'] = this.genreIds;
    data['id'] = this.id;
    data['original_language'] = this.originalLanguage;
    data['original_title'] = this.originalTitle;
    data['poster_path'] = this.posterPath;
    data['title'] = this.title;
    data['video'] = this.video;
    data['popularity'] = this.popularity;
    data['media_type'] = this.mediaType;
    data['name'] = this.name;
    data['first_air_date'] = this.firstAirDate;
    data['origin_country'] = this.originCountry;
    data['original_name'] = this.originalName;
    return data;
  }
}
