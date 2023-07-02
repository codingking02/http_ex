import 'package:flutter/material.dart';
import 'package:http_ex/model/post_model.dart';
import 'package:http_ex/network/http_connection.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String titleMethod = "Choose Method";
  String titlePost = "";
  String bodyPost = "";
  final HttpConnections _httpConnections = HttpConnections();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Http'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              titleMethod,
              style: TextStyle(fontSize: 25),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Title : ",
              style: TextStyle(fontSize: 25),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              titlePost,
              style: TextStyle(fontSize: 15),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Body : ",
              style: TextStyle(fontSize: 25),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              bodyPost,
              style: TextStyle(fontSize: 15),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    Post post = await _httpConnections.fetchPost(1);
                    setState(() {
                      bodyPost = post.body;
                      titlePost = post.title;
                      titleMethod = 'Get';
                    });
                  },
                  child: Text('Get'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    setState(() async {
                      Post post = await _httpConnections.createPost(
                          "mytitle", "mypost body");
                      titleMethod = 'Post';
                    });
                  },
                  child: Text('Post'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      titleMethod = 'update';
                    });
                  },
                  child: Text('Update'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      titleMethod = 'delete';
                    });
                  },
                  child: Text('Delete'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
