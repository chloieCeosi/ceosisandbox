import 'package:http/http.dart' as http;
import 'package:sandbox/examples/june/models/post_list_model.dart';
import 'package:sandbox/examples/june/models/post_model.dart';

import '../constants/endpoints.dart';
import '../services/api_service.dart';

class PostRepository {
  Future<List<PostListModel>?> getPosts() async {
    var client = http.Client();
    var response = await client.get(ApiService.url(endpoint: EndPoint.posts));

    try {
      if (response.statusCode == 200) {
        print(response.body);
        return postListModelFromJson(response.body);
      }
    } catch (e) {
      print('An error has occurred!');
      print(response.body);
    }

    return null;
  }

  Future<PostModel?> getPost(String postID) async {
    var client = http.Client();
    var response = await client
        .get(ApiService.url(endpoint: EndPoint.posts, query: postID));

    try {
      if (response.statusCode == 200) {
        print(response.body);
        return postModelFromJson(response.body);
      }
    } catch (e) {
      print('An error has occurred!');
      print(response.body);
    }

    return null;
  }
}