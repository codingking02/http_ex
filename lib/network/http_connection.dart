import 'dart:convert';
import 'package:http/http.dart' as varHttp;
import 'package:http/http.dart';
import 'package:http_ex/model/post_model.dart';

class HttpConnections {
  static String baseUrl = "https://jsonplaceholder.typicode.com/";
  static String postEndPoint = "posts";
  final client = varHttp.Client();

  Future<Post> fetchPost(int id) async {
    Response response = await client.get(
      Uri.parse(baseUrl + postEndPoint + '/$id'),
    );

    if (response.statusCode == 200) {
      String body = response.body;
      Map<String, dynamic> _map =
          jsonDecode(body); // 1- return string to json // 2- json to map
      // 3- map to dart data
      Post _post = Post.fromJson(
        _map,
      );
      return _post;
    } else {
      throw Exception("failed to load posts $id");
    }
  }
}
