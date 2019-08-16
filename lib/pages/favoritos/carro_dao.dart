import 'dart:async';

import 'package:carros/pages/carros/carro.dart';
import 'package:carros/pages/favoritos/db_helper.dart';
import 'package:sqflite/sqflite.dart';

// Data Access Object
class CarroDAO {

  Future<Database> get db => DatabaseHelper.getInstance().db;

  Future<int> save(Carro carro) async {
    var dbClient = await db;
    var id = await dbClient.insert("carro", carro.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    print('id: $id');
    return id;
  }

  Future<List<Carro>> findAll() async {
    final dbClient = await db;

    final list = await dbClient.rawQuery('select * from carro');

    final carros = list.map<Carro>((json) => Carro.fromJson(json)).toList();

    return carros;
  }

  Future<List<Carro>> findAllByTipo(String tipo) async {
    final dbClient = await db;

    final list = await dbClient.rawQuery('select * from carro where tipo =? ',[tipo]);

    final carros = list.map<Carro>((json) => Carro.fromJson(json)).toList();

    return carros;
  }

  Future<Carro> findById(int id) async {
    var dbClient = await db;
    final list =
        await dbClient.rawQuery('select * from carro where id = ?', [id]);

    if (list.length > 0) {
      return new Carro.fromJson(list.first);
    }

    return null;
  }

  Future<bool> exists(Carro carro) async {
    Carro c = await findById(carro.id);
    var exists = c != null;
    return exists;
  }

  Future<int> count() async {
    final dbClient = await db;
    final list = await dbClient.rawQuery('select count(*) from carro');
    return Sqflite.firstIntValue(list);
  }

  Future<int> delete(int id) async {
    var dbClient = await db;
    return await dbClient.rawDelete('delete from carro where id = ?', [id]);
  }

  Future<int> deleteAll() async {
    var dbClient = await db;
    return await dbClient.rawDelete('delete from carro');
  }
}
