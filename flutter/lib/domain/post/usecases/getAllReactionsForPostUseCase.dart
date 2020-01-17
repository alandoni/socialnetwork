import '../postRepostiory.dart';

import '../post.dart';
import '../reaction.dart';

class GetAllReactionsForPostUseCase {
  PostRepository postRepository;

  GetAllReactionsForPostUseCase(PostRepository postRepository) {
    this.postRepository = postRepository;
  }

  Future<List<Reaction>> run(Post post) {
    return postRepository.retrieveReactionsForPost(post);
  }
}