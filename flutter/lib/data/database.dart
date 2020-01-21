import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AppDatabase {
  Database database;

  Future<Database> createDatabase() async {
    if (this.database != null && this.database.isOpen) {
      return this.database;
    }
    final database = openDatabase(
      join(await getDatabasesPath(), "socialnetwork.db"),

      onCreate: (db, version) async {
        await db.execute("CREATE TABLE `users`(`id` INTEGER PRIMARY KEY, `username` TEXT, `email` TEXT);");
        await db.execute("CREATE TABLE `posts`(`id` INTEGER PRIMARY KEY, `text` TEXT, `date` TEXT, `reactions` TEXT, `user` TEXT);");
      },

      version: 3
    );
    this.database = await database;
    return database;
  }

  Future<int> insert(String table, Map values) async {
    Database db = await createDatabase();
    int result = await db.insert(table, values, conflictAlgorithm: ConflictAlgorithm.replace);
    return result;
  }

  Future<List<Map<String, dynamic>>> get(String table, String where, List<String> whereArgs) async {
    Database db = await createDatabase();
    List<dynamic> maps = await db.query(table, where: where, whereArgs: whereArgs);
    return maps.toList();
  }

  Future<int> update(String table, values, String where, List<String> whereArgs) async {
    final Database db = await createDatabase();
    int result = await db.update(table, values, where: where, whereArgs: whereArgs);
    return result;
  }

  Future<int> delete(String table, String where, List<String> whereArgs) async {
    final Database db = await createDatabase();
    int result = await db.delete(table, where: where, whereArgs: whereArgs);
    return result;
  }
}