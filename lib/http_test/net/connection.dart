import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:http_ex/http_test/model/mypost.dart';

class Connection {
  String URLbase = "//https://jsonplaceholder.typicode.com/";
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
}
