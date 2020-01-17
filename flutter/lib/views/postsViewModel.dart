import 'package:flutter/material.dart';
import '../data/httpClient.dart';
import '../domain/post/post.dart';
import '../domain/user/user.dart';
import 'bindingTextField.dart';
import 'dart:convert';

class PostsViewModel extends ChangeNotifier {
  Binding<String> post = Binding.initialValue("");
  List<Post> posts = List();
  String error;

  void loadData() async {
    HttpClient client = HttpClient();
    try {
      Iterable response = await client.get("/post");
      if (response != null) {
        this.posts = response.map((model) {
          return Post.fromJson(model);
        }).toList();
      }
    } catch (error) {
      this.error = error.toString();
    }
    notifyListeners();
  }

  void createPost() async {
    Post newPost = Post(user: User.currentUser, text: post.value, date: DateTime.now().millisecondsSinceEpoch);
    HttpClient client = HttpClient();
    try {
      Map<String, dynamic> response = await client.post("/post", json.encode(newPost.toJson()));
      if (response != null) {
        Post storedPost = Post.fromJson(response);
        posts.add(storedPost);
        loadData();
        return;
      }
    } catch (error) {
      this.error = error.toString();
    }
    notifyListeners();
  }
}