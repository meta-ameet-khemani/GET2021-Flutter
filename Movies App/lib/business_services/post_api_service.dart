import 'dart:convert';
import '../models/api_constants.dart';
import '../core_services/gateway_service.dart';
import '../models/constants.dart';
import '../models/api_response.dart';
import '../models/post_model.dart';

class PostAPIService {
  IGateWay? _gateWay;

  PostAPIService(this._gateWay);

  Future<ApiResponse<List<PostModel>>> getAllPosts() async {
    try {
      ApiResponse apiResponse = await _gateWay!.invoke(ApiConstants.getPosts);
      return apiResponse.success!
          ? ApiResponse((json.decode(apiResponse.model.body) as List)
              .map((a) => PostModel.fromMap(a))
              .toList())
          : ApiResponse.constructFrom(apiResponse);
    } catch (e) {
      return ApiResponse.networkFailure(
          Constants.networkErrorTitle, e.toString());
    }
  }
}
