import 'dart:convert';
import '../models/api_constants.dart';
import '../models/constants.dart';
import '../models/movies_result_model.dart';
import '../core_services/gateway_service.dart';
import '../models/api_response.dart';
import '../models/movie_model.dart';

class TmdbApiMoviesService {
  IGateWay? _gateWay;

  TmdbApiMoviesService(this._gateWay);

  Future<ApiResponse<List<MovieModel>>> getTrending() async {
    try {
      ApiResponse apiResponse = await _gateWay!.invoke(
          ApiConstants.GET_TRENDING, {'Content-Type': 'application/json'});
      return apiResponse.success!
          ? ApiResponse(
              MoviesResultModel.fromJson(json.decode(apiResponse.model.body))
                  .movies)
          : ApiResponse.constructFrom(apiResponse);
    } catch (e) {
      return ApiResponse.networkFailure(
          Constants.networkErrorTitle, e.toString());
    }
  }

  Future<ApiResponse<List<MovieModel>>> getPopular() async {
    try {
      ApiResponse apiResponse = await _gateWay!.invoke(
          ApiConstants.GET_POPULAR, {'Content-Type': 'application/json'});
      return apiResponse.success!
          ? ApiResponse(
              MoviesResultModel.fromJson(json.decode(apiResponse.model.body))
                  .movies)
          : ApiResponse.constructFrom(apiResponse);
    } catch (e) {
      return ApiResponse.networkFailure(
          Constants.networkErrorTitle, e.toString());
    }
  }

  Future<ApiResponse<List<MovieModel>>> getUpcoming() async {
    try {
      ApiResponse apiResponse = await _gateWay!.invoke(
          ApiConstants.GET_UPCOMING, {'Content-Type': 'application/json'});
      return apiResponse.success!
          ? ApiResponse(
              MoviesResultModel.fromJson(json.decode(apiResponse.model.body))
                  .movies)
          : ApiResponse.constructFrom(apiResponse);
    } catch (e) {
      return ApiResponse.networkFailure(
          Constants.networkErrorTitle, e.toString());
    }
  }

  Future<ApiResponse<List<MovieModel>>> getPlayingNow() async {
    try {
      ApiResponse apiResponse = await _gateWay!.invoke(
          ApiConstants.GET_PLAYING_NOW, {'Content-Type': 'application/json'});
      return apiResponse.success!
          ? ApiResponse(
              MoviesResultModel.fromJson(json.decode(apiResponse.model.body))
                  .movies)
          : ApiResponse.constructFrom(apiResponse);
    } catch (e) {
      return ApiResponse.networkFailure(
          Constants.networkErrorTitle, e.toString());
    }
  }
}
