import 'dart:convert';
import '../../domain/post/reaction.dart';
import '../../domain/post/post.dart';
import '../httpClient.dart';

class PostService {
  Future<Post> createPost(Post post) async {
    HttpClient client = HttpClient();
    Map<String, dynamic> response = await client.post("/post", json.encode(post.toJson()));
    return Post.fromJson(response);
  }

  Future<List<Post>> getPosts() async {
    HttpClient client = HttpClient();
    List<dynamic> response = await client.get("/post");
    return response.map((model) {
      return Post.fromJson(model);
    }).toList();
  }

  Future<Post> reactToPost(Reaction reaction) async {
    HttpClient client = HttpClient();
    String postId = reaction.post.id;
    Map<String, dynamic> response = await client.post("/post/$postId/reaction", json.encode(reaction.toJson()));
    return Post.fromJson(response);
  }
}