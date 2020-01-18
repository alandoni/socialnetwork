import '../database.dart';
import '../../domain/post/post.dart';

class PostDao {
  AppDatabase database;
  static const String TABLE = "posts";

  PostDao(AppDatabase database) {
    this.database = database;
  }

  Future<int> insert(Post post) {
    return this.database.insert(TABLE, post.toJson());
  }

  Future<List<Post>> getAll() async {
    List<Map<String, dynamic>> list = await this.database.get(TABLE, null, null);
    return list.map((Map model) {
      return Post.fromJson(model);
    });
  }
}