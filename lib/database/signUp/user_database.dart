import 'package:flutter_application_1/models/signUp/user_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';

class UserDatabase {
  static const nameDB = 'users';
  static const versionDB = 1;
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, nameDB);

    return await openDatabase(
      path,
      version: versionDB,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE $nameDB (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            username varchar(50),
            email varchar(50),
            password varchar(30),
            image BLOB
          )
        ''');
      },
    );
  }

  // Insertar usuario
  Future<int> insertUser(String table, UserModel user) async {
    final db = await database;
    return await db.insert(table, user.toMap());
  }

  // Obtener todos los usuarios
  Future<List<UserModel>> getUsers() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('users');
    return List.generate(maps.length, (i) => UserModel.fromMap(maps[i]));
  }

  // Obtener usuario por ID
  Future<UserModel?> getUserById(String table, int id) async {
    final db = await database;
    final List<Map<String, dynamic>> maps =
        await db.query(table, where: 'id = ?', whereArgs: [id]);
    if (maps.isNotEmpty) {
      return UserModel.fromMap(maps.first);
    }
    return null;
  }

  // Actualizar usuario
  Future<int> updateUser(String table, UserModel user) async {
    final db = await database;
    return await db
        .update(table, user.toMap(), where: 'id = ?', whereArgs: [user.id]);
  }

  // Eliminar usuario
  Future<int> deleteUser(String table, int id) async {
    final db = await database;
    return await db.delete(table, where: 'id = ?', whereArgs: [id]);
  }


  //Sesion 
  Future<Map<String, dynamic>?> getUser(String table, String username, String password) async {
    final db = await database;
    final List<Map<String, dynamic>> result = await db.query(
      'users',
      where: 'email = ? AND password = ?',
      whereArgs: [username, password],
    );
    return result.isNotEmpty ? result.first : null;
  }
}
