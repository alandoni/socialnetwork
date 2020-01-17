import '../postRepostiory.dart';

import '../post.dart';

class CreatePostUseCase {
  PostRepository postRepository;

  CreatePostUseCase(PostRepository postRepository) {
    this.postRepository = postRepository;
  }

  Future<Post> run(Post post) {
    return postRepository.createPost(post);
  }
}