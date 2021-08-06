import 'api_config/tmdb_movie_config.dart';
import 'api_config/post_config.dart';

class PostConfigService {
  static var _postsConfigs = {...postsCofig};

  static getConfig() {
    return _postsConfigs;
  }
}

class TmdbMovieConfigService {
  static var _tmdbMovieConfigs = {...tmdbMovieConfig};

  static getConfig() {
    return _tmdbMovieConfigs;
  }
}
