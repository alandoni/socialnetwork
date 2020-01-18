import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AppDatabase {
  Database database;

  Future<Database> createDatabase() async {
    if (this.database != null) {
      return this.database;
    }
    final database = openDatabase(
      join(await getDatabasesPath(), "socialnetwork.db"),

      onCreate: (db, version) {
        return db.execute(
          """CREATE TABLE `users`(`id` INTEGER PRIMARY KEY, `username` TEXT, `email` TEXT);
          CREATE TABLE `posts`(`id` INTEGER PRIMARY KEY, `text` TEXT, `date` TEXT, `reactions` TEXT, `user` TEXT)"""
        );
      },

      version: 1
    );
    return database;
  }

  Future<int> insert(String table, Map values) async {
    Database db = await createDatabase();
    int result = await db.insert(table, values, conflictAlgorithm: ConflictAlgorithm.replace);
    db.close();
    return result;
  }

  Future<List<Map<String, dynamic>>> get(String table, String where, List<String> whereArgs) async {
    final Database db = await createDatabase();
    final List<Map<String, dynamic>> maps = await db.query(table, where: where, whereArgs: whereArgs);
    db.close();
    if (maps.length > 0) {
      return maps;
    } else {
      return List<Map<String, dynamic>>();
    }
  }

  Future<int> update(String table, values, String where, List<String> whereArgs) async {
    final Database db = await createDatabase();
    int result = await db.update(table, values, where: where, whereArgs: whereArgs);
    db.close();
    return result;
  }

  Future<int> delete(String table, String where, List<String> whereArgs) async {
    final Database db = await createDatabase();
    int result = await db.delete(table, where: where, whereArgs: whereArgs);
    db.close();
    return result;
  }
}