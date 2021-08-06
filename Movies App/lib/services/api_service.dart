import '../models/movie_model.dart';
import '../models/api_response.dart';
import '../models/post_model.dart';

abstract class IApi {
  Future<ApiResponse<List<PostModel>>> getAllPosts();

  Future<ApiResponse<List<MovieModel>>> getTrending();

  Future<ApiResponse<List<MovieModel>>> getPopular();

  Future<ApiResponse<List<MovieModel>>> getUpcoming();

  Future<ApiResponse<List<MovieModel>>> getPlayingNow();
}
