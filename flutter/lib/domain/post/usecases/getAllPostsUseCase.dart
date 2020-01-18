import '../postRepostiory.dart';

import '../post.dart';

class GetAllPostsUseCase {
  PostRepository postRepository;

  GetAllPostsUseCase(PostRepository postRepository) {
    this.postRepository = postRepository;
  }

  Future<List<Post>> run() {
    return postRepository.retrieveAllPosts();
  }
}