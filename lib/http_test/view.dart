import 'package:flutter/material.dart';
import 'package:http_ex/http_test/model/mypost.dart';
import 'package:http_ex/http_test/net/connection.dart';

class MyView extends StatefulWidget {
  const MyView({super.key});

  @override
  State<MyView> createState() => _MyViewState();
}

class _MyViewState extends State<MyView> {
  Connection connection = Connection();
  String MethodTitle = "Get";
  String TitleBody = "";
  String mybody = "";
  static TextStyle mystyle = TextStyle(fontSize: 25);
  static TextStyle mysecstyle = TextStyle(fontSize: 15);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MyPosts"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              MethodTitle,
              style: mystyle,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Title : ",
              style: mystyle,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              TitleBody,
              style: mysecstyle,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Body : ",
              style: mystyle,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              mybody,
              style: mysecstyle,
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    MyPost myPost = await connection.FetchPost(1);
                    setState(() {
                      TitleBody = myPost.title;
                      mybody = myPost.body;
                      MethodTitle = "Get";
                    });
                  },
                  child: Text("Get"),
                ),
                ElevatedButton(
                  onPressed: () async {
                    MyPost myPost = await connection.CreatePost(
                      "my title",
                      "my body",
                    );
                    setState(() {
                      TitleBody = myPost.title;
                      mybody = myPost.body;
                      MethodTitle = "Post";
                    });
                  },
                  child: Text("Post"),
                ),
                ElevatedButton(
                  onPressed: () async {
                    MyPost mypost =
                        await connection.UpdatePost(1, "hello", "zeyad");
                    setState(() {
                      TitleBody = mypost.title;
                      mybody = mypost.body;
                      MethodTitle = "Put";
                    });
                  },
                  child: Text("Put"),
                ),
                ElevatedButton(
                  onPressed: () async {
                    MyPost myPost = await connection.DeletePost(1);
                    setState(() {
                      TitleBody = myPost.title;
                      mybody = myPost.body;
                      MethodTitle = "Delete";
                    });
                  },
                  child: Text("Delete"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
