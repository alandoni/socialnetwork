import '../postRepostiory.dart';

import '../post.dart';
import '../reaction.dart';

class ReactToPostUseCase {
  PostRepository postRepository;

  ReactToPostUseCase(PostRepository postRepository) {
    this.postRepository = postRepository;
  }

  Future<Post> run(Reaction reaction) {
    return postRepository.reactToPost(reaction);
  }
}