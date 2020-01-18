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
    List<Map<String, dynamic>> items = await this.database.get(TABLE, null, null);
    return items.map((model) {
      return Post.fromJson(model);
    }).toList();
  }
}