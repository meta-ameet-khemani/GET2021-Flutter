import '../../models/api_constants.dart';

const Map<String, dynamic> tmdbMovieConfig = {
  ApiConstants.GET_TRENDING: {
    'url':
        '${ApiConstants.BASE_URL}trending/movie/day?api_key=${ApiConstants.API_KEY}',
  },
  ApiConstants.GET_POPULAR: {
    'url':
        '${ApiConstants.BASE_URL}movie/popular?api_key=${ApiConstants.API_KEY}',
  },
  ApiConstants.GET_UPCOMING: {
    'url':
        '${ApiConstants.BASE_URL}movie/upcoming?api_key=${ApiConstants.API_KEY}',
  },
  ApiConstants.GET_PLAYING_NOW: {
    'url':
        '${ApiConstants.BASE_URL}movie/now_playing?api_key=${ApiConstants.API_KEY}',
  },
};
