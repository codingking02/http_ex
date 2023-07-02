import 'dart:convert';
import 'package:http/http.dart' as varHttp;
import 'package:http/http.dart';
import 'package:http_ex/model/post_model.dart';

class HttpConnections {
  static String baseUrl = "https://jsonplaceholder.typicode.com/";
  static String postEndPoint = "posts";
  final client = varHttp.Client();

  Future<Post> createPost(String title, String body) async {
    Map mybody = {'title': title, 'body': body};
    Response response = await client.post(
      Uri.parse(
        baseUrl + postEndPoint,
      ),
      body: jsonEncode(
        mybody,
      ),
    );
    print(response.body);

    if (response.statusCode == 201) {
      Map<String, dynamic> _map = jsonDecode(response.body);
      Post _post = Post.fromJson(
        _map,
      );
      return _post;
    } else {
      throw Exception("failed to create posts ");
    }
  }

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

  Future<Post> updatePost(int postid, String title, String body) async {
    Map mybody = {
      'title': title,
      'body': body,
    };
    Response response = await client.put(
      Uri.parse(
        baseUrl + postEndPoint + "/$postid",
      ),
      body: jsonEncode(
        mybody,
      ),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      Post _post = Post.fromJson(jsonDecode(response.body));
      return _post;
    } else {
      throw Exception("failed to update posts");
    }
  }
}
