import 'reaction.dart';
import 'post.dart';

abstract class PostRepository {
  Future<Post> createPost(Post post);
  Future<Post> reactToPost(Reaction reaction);
  Future<List<Post>> retrieveAllPosts();
  Future<List<Reaction>> retrieveReactionsForPost(Post post);
}