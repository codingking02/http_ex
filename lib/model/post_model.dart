class Post {
  int userId;
  int id;
  String title;
  String body;
  Post({
    required this.body,
    required this.id,
    required this.title,
    required this.userId,
  });
  factory Post.fromJson(Map<String, dynamic> _map) {
    Post _post = Post(
      body: _map["body"] ?? '',
      id: _map["id"] ?? 0,
      title: _map["title"] ?? '',
      userId: _map["userId"] ?? 0,
    );
    return _post;
  }
}
