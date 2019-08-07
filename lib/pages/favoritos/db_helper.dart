import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper.getInstance();
  factory DatabaseHelper() => _instance;
  DatabaseHelper.getInstance();

  static Database _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();

    return _db;
  }

  Future initDb() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'carros.db');
    print("db $path");

    // para testes vc pode deletar o banco
//    await deleteDatabase(path);

    var db = await openDatabase(path, version: 1, onCreate: _onCreate, onUpgrade: _onUpgrade);
    return db;
  }

  void _onCreate(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE carro(id INTEGER PRIMARY KEY, tipo TEXT, nome TEXT'
        ', descricao TEXT, urlFoto TEXT, urlVideo TEXT, latitude TEXT, longitude TEXT)');
  }

  FutureOr<void> _onUpgrade(Database db, int oldVersion, int newVersion) {
    print("_onUpgrade: oldVersion: $oldVersion > newVersion: $newVersion");
  }

  Future close() async {
    var dbClient = await db;
    return dbClient.close();
  }
}
