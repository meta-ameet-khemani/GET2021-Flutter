import '../../models/enums/http_methods.dart';
import '../../models/api_constants.dart';

const Map<String, dynamic> postsCofig = {
  ApiConstants.createPosts: {
    'url': 'https://jsonplaceholder.typicode.com/posts',
    'http_method': HTTPMETHODS.POST,
  },
  ApiConstants.getPosts: {
    'url': 'https://jsonplaceholder.typicode.com/posts',
  },
};
