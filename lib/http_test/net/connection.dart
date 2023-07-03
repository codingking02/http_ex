import 'dart:convert';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:http_ex/http_test/model/mypost.dart';

class Connection {
  String URLbase = "https://jsonplaceholder.typicode.com/";
  String EndPoint = "posts";
  Client client = http.Client();

  Future<MyPost> FetchPost(int id) async {
    Response response = await client.get(
      Uri.parse(URLbase + EndPoint + '/$id'),
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> mymap = jsonDecode(response.body);
      MyPost _mypost = MyPost.fromJson(
        mymap,
      );
      return _mypost;
    } else {
      throw Exception("failed to load posts");
    }
  }

  Future<MyPost> CreatePost(String title, String body) async {
    Map mybody = {"title": title, "body": body};
    Response response = await client.post(
      Uri.parse(
        URLbase + EndPoint,
      ),
      body: jsonEncode(
        mybody,
      ),
    );
    print(response.body);
    if (response.statusCode == 201) {
      Map<String, dynamic> mp = jsonDecode(response.body);
      MyPost _mypost = MyPost.fromJson(mp);
      return _mypost;
    } else {
      throw Exception("failed to create post");
    }
  }

  Future<MyPost> UpdatePost(int Postid, String title, String body) async {
    Map mybody = {"title": title, "body": body};
    Response response = await client.put(
      Uri.parse(
        URLbase + EndPoint + "/$Postid",
      ),
      body: jsonEncode(mybody),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> _map = jsonDecode(response.body);
      MyPost _myPost = MyPost.fromJson(_map);
      return _myPost;
    } else {
      throw Exception('failed to update');
    }
  }

  Future<MyPost> DeletePost(int id) async {
    Response response = await client.delete(
      Uri.parse(
        URLbase + EndPoint + '/$id',
      ),
    );
    if (response.statusCode == 200) {
      MyPost myPost = MyPost.fromJson({});
      return myPost;
    } else {
      throw Exception("failed to delete");
    }
  }

  Future<List<MyPost>> getAllPosts() async {
    Response response = await client.get(
      Uri.parse(URLbase + EndPoint),
    );
    if (response.statusCode == 200) {
      List<dynamic> bodylist = jsonDecode(response.body);
      List<MyPost> myposts = bodylist.map((e) => MyPost.fromJson(e)).toList();
      return myposts;
    } else {
      return [];
    }
  }
}
