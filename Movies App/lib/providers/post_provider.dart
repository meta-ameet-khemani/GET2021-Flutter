import '../models/post_model.dart';
import '../models/api_response.dart';
import '../services/api_services.dart';
import '../services/api_service.dart';
import '../core_services/gateway_service.dart';
import '../providers/base_provider.dart';

class PostProvider extends BaseProvider {
  Gateway? gateway;
  IApi? api;
  List<PostModel> _posts = [];

  PostProvider(this.gateway) {
    api = ApiServices(gateway);
  }

  List<PostModel> get getAllPosts => _posts;

  Future<List<PostModel>> fetchAllPosts() async {
    ApiResponse apiResponse = await api!.getAllPosts();
    _posts = apiResponse.statusCode == 200 ? apiResponse.model : null;
    notifyListeners();
    return _posts;
  }
}
