// dbhelper.dart
import 'dart:async';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqlite_api.dart';
import '../model/usermodel.dart';

class DataHelper {
  static const _dataBaseName = "users.db";
  static const _databaseVersion = 1;

  static const TableName = 'users';

  Database? _database;
  Future<Database> get database async {
    final dbPath = await getDatabasesPath();

    final path = join(dbPath, _dataBaseName);
    _database = await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
    return _database!;
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
        CREATE TABLE $TableName(
          id INTEGER PRIMARY KEY,
          name TEXT,
          email TEXT,
          address TEXT,
          phoneNumber TEXT,
          password TEXT
        )
      ''');
  }

  Future<void> insertUsers(Users users) async {
    final db = await database;
    await db.insert(TableName, users.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<Users?> getUsersByEmail(String email) async {
    final db = await database;
    List<Map<String, dynamic>> maps = await db.query(
      TableName,
      where: 'email = ?',
      whereArgs: [email],
    );
    if (maps.isNotEmpty) {
      return Users.fromMap(maps.first);
    } else {
      return null;
    }
  }
}
