import '../../domain/user/user.dart';

import '../database.dart';

class UserDao {
  AppDatabase database;
  static const String TABLE = "users";

  UserDao(AppDatabase database) {
    this.database = database;
  }

  Future<List<User>> getAll() async {
    List<Map<String, dynamic>> items = await this.database.get(TABLE, null, null);
    return items.map((Map model) {
      return User.fromJson(model);
    });
  }

  Future<int> insert(User user) async {
    return await this.database.insert(TABLE, user.toJson());
  }
}