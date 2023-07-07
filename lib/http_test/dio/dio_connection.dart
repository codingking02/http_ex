import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:http_ex/http_test/model/mypost.dart';

class DioConnection {
  static String URLbase = "https://jsonplaceholder.typicode.com/";
  String EndPoint = "posts";
  final dio = Dio(
    BaseOptions(
      baseUrl: URLbase,
      connectTimeout: const Duration(seconds: 5000),
      receiveTimeout: const Duration(seconds: 3000),
    ),
  );
  Future<MyPost?> getPostData(int id) async {
    try {
      Response response = await dio.get(EndPoint + "/$id");
      if (response.statusCode == 200) {
        Map<String, dynamic> mymap = response.data;
        MyPost myPost = MyPost.fromJson(mymap);
        return myPost;
      }
    } on DioException catch (e) {
      print(e.error.toString());
      print(e.message);
      throw Exception(e.message);
    }
  }

  Future<MyPost?> createPost(String title, String body) async {
    try {
      Map<String, dynamic> map = {"title": title, "body": body};

      Response response = await dio.post(EndPoint, data: jsonEncode(map));
      if (response.statusCode == 201) {
        Map<String, dynamic> mymap = response.data;
        MyPost myPost = MyPost.fromJson(mymap);
        print(response.data);
        return myPost;
      }
    } on DioException catch (e) {
      print(e.error.toString());
      print(e.message);
      throw Exception(e.message);
    }
  }

  Future<MyPost?> updatePost(String title, String body, int id) async {
    Map<String, dynamic> map = {"title": title, "body": body};
    Response response = await dio.put(EndPoint + "/$id", data: jsonEncode(map));
    if (response.statusCode == 200) {
      Map<String, dynamic> mymap = response.data;
      MyPost myPost = MyPost.fromJson(mymap);
      print(response.data);
      return myPost;
    } else {
      throw Exception("failed to update post");
    }
  }

  Future<MyPost> deletePost(int id) async {
    Response response = await dio.delete(EndPoint + "/$id");
    if (response.statusCode == 200) {
      Map<String, dynamic> mymap = {};
      MyPost myPost = MyPost.fromJson(mymap);
      print(response.data);
      return myPost;
    } else {
      throw Exception("failed to delete post");
    }
  }

  Future<List<MyPost>> getAllPosts() async {
    Response response = await dio.get(EndPoint);
    if (response.statusCode == 200) {
      List<dynamic> myposts = response.data;
      List<MyPost> allposts = myposts.map((e) => MyPost.fromJson(e)).toList();
      return allposts;
    } else {
      throw Exception("failed to get all posts");
    }
  }
}
