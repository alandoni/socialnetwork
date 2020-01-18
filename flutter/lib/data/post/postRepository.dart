import '../../domain/post/post.dart';
import '../../domain/post/postRepostiory.dart';
import '../../domain/post/reaction.dart';
import 'postDao.dart';
import 'postService.dart';

class PostRepositoryImpl implements PostRepository {
  PostDao postDao;
  PostService postService;

  PostRepositoryImpl(PostDao postDao, PostService postService) {
    this.postDao = postDao;
    this.postService = postService;
  }

  @override
  Future<Post> createPost(Post post) async {
    await postDao.insert(post);
    Post newPost = await postService.createPost(post);
    return newPost;
  }

  @override
  Future<Post> reactToPost(Reaction reaction) async {
    Post newPost = await postService.reactToPost(reaction);
    await postService.createPost(newPost);
    return newPost;
  }

  @override
  Future<List<Post>> retrieveAllPosts() async {
    List<Post> posts = await postService.getPosts();
    posts.forEach((post) {
      postDao.insert(post);
    });
    return posts;
  }

  @override
  Future<List<Reaction>> retrieveReactionsForPost(Post post) {
    return null;
  }
}