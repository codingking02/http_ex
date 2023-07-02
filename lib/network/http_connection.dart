import 'package:http/http.dart' as varHttp;
import 'package:http/http.dart';

class HttpConnections {
  static String baseUrl = "https://jsonplaceholder.typicode.com/";
  static String postEndPoint = "posts";
  final client = varHttp.Client();

  void fetchPost(int id) async {
    Response response = await client.get(
      Uri.parse(baseUrl + postEndPoint + '/$id'),
    );

    if (response.statusCode == 200) {}
  }
}
