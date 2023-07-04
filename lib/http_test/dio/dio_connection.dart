import 'package:dio/dio.dart';

class DioConnection {
  static String URLbase = "https://jsonplaceholder.typicode.com/";
  String EndPoint = "posts";
  Dio dio = Dio(
    BaseOptions(
      baseUrl: URLbase,
      connectTimeout: const Duration(seconds: 5000),
      receiveTimeout: const Duration(seconds: 3000),
    ),
  );
}
