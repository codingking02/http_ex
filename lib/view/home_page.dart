import 'package:flutter/material.dart';
import 'package:http_ex/model/post_model.dart';
import 'package:http_ex/network/http_connection.dart';
import './myallposts.dart';

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
                    Post post = await _httpConnections.createPost(
                        "mytitle", "mypost body");
                    setState(() {
                      titleMethod = 'Post';
                      bodyPost = post.body;
                      titlePost = post.title;
                    });
                  },
                  child: Text('Post'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    Post post =
                        await _httpConnections.updatePost(1, "hello", "zeyad");
                    setState(() {
                      bodyPost = post.body;
                      titlePost = post.title;
                      titleMethod = 'update';
                    });
                  },
                  child: Text('Update'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    Post post = await _httpConnections.deletePost(1);
                    setState(() {
                      bodyPost = post.body;
                      titlePost = post.title;
                      titleMethod = 'delete';
                    });
                  },
                  child: Text('Delete'),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return AllPosts();
                    },
                  ),
                );
              },
              child: Text("show all posts"),
            ),
          ],
        ),
      ),
    );
  }
}
