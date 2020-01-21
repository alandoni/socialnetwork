import 'package:SocialNetwork/domain/post/reaction.dart';
import 'package:SocialNetwork/domain/post/usecases/reactToPostUseCase.dart';

import '../data/database.dart';
import '../data/post/postDao.dart';
import '../data/post/postRepository.dart';
import '../data/post/postService.dart';
import '../domain/post/postRepostiory.dart';
import '../domain/post/usecases/createPostUseCase.dart';
import '../domain/post/usecases/getAllPostsUseCase.dart';
import 'package:flutter/material.dart';
import '../domain/post/post.dart';
import '../domain/user/user.dart';
import 'bindingTextField.dart';

class PostsViewModel extends ChangeNotifier {
  Binding<String> post = Binding.initialValue("");
  List<Post> posts = List();
  String error;

  PostRepository postRepository;

  PostsViewModel() {
    this.postRepository = PostRepositoryImpl(PostDao(AppDatabase()), PostService());
  }

  void loadData() async {
    try {
      this.posts = await GetAllPostsUseCase(postRepository).run();
    } catch (error) {
      this.error = error.toString();
    }
    notifyListeners();
  }

  void createPost() async {
    Post newPost = Post(user: User.currentUser, text: post.value, date: DateTime.now().millisecondsSinceEpoch);
    try {
      Post storedPost = await CreatePostUseCase(postRepository).run(newPost);
      posts.add(storedPost);
    } catch (error) {
      this.error = error.toString();
    }
    notifyListeners();
  }

  void reactToPost(Post post, ReactionType reactionType) async {
    Reaction reaction = Reaction(post, reactionType, User.currentUser, DateTime.now().millisecondsSinceEpoch);
    try {
      Post response = await ReactToPostUseCase(postRepository).run(reaction);
      int indexOf = posts.indexWhere((post) => response.id == post.id);
      posts.replaceRange(indexOf, indexOf, [response]);
    } catch (error) {
      this.error = error.toString();
    }
    notifyListeners();
  }
}