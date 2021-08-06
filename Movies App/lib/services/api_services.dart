import '../business_services/tmdb_api_movies_service.dart';
import '../business_services/post_api_service.dart';
import '../core_services/gateway_service.dart';
import '../models/movie_model.dart';
import '../models/post_model.dart';
import '../models/api_response.dart';
import '../services/api_service.dart';

class ApiServices implements IApi {
  IGateWay? _gateWay;
  late PostAPIService _postApiService;
  late TmdbApiMoviesService _apiMoviesService;

  ApiServices(this._gateWay) {
    _postApiService = PostAPIService(_gateWay);
    _apiMoviesService = TmdbApiMoviesService(_gateWay);
  }

  @override
  Future<ApiResponse<List<PostModel>>> getAllPosts() {
    return _postApiService.getAllPosts();
  }

  @override
  Future<ApiResponse<List<MovieModel>>> getTrending() {
    return _apiMoviesService.getTrending();
  }

  @override
  Future<ApiResponse<List<MovieModel>>> getPopular() {
    return _apiMoviesService.getPopular();
  }

  @override
  Future<ApiResponse<List<MovieModel>>> getPlayingNow() {
    return _apiMoviesService.getPlayingNow();
  }

  @override
  Future<ApiResponse<List<MovieModel>>> getUpcoming() {
    return _apiMoviesService.getUpcoming();
  }
}
