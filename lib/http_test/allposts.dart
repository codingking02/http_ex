import 'package:flutter/material.dart';
import 'package:http_ex/http_test/net/connection.dart';

class PostsList extends StatefulWidget {
  const PostsList({super.key});

  @override
  State<PostsList> createState() => _PostsListState();
}

class _PostsListState extends State<PostsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("all list"),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: Connection().getAllPosts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: const CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            return ListView.separated(
              separatorBuilder: (context, index) {
                return Divider(
                  color: Colors.blue,
                  height: 10,
                  thickness: 10,
                );
              },
              padding: const EdgeInsets.all(20),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Title : ${snapshot.data![index].title}'),
                  subtitle: Text('Body :  ${snapshot.data![index].body}'),
                );
              },
            );
          } else {
            return Center(
              child: const Text("No Data"),
            );
          }
        },
      ),
    );
  }
}
