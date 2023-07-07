import 'package:flutter/material.dart';
import 'package:http_ex/http_test/view/view.dart';

//https://jsonplaceholder.typicode.com

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: MyView(),
    );
  }
}
