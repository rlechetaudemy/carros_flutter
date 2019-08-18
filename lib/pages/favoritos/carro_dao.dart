import 'package:carros/pages/carros/carro.dart';
import 'package:carros/pages/favoritos/base_dao.dart';

// Data Access Object
class CarroDAO extends BaseDAO<Carro> {

  @override
  String get tableName => "carro";

  @override
  Carro fromMap(Map<String, dynamic> map) {
    return Carro.fromMap(map);
  }

  Future<List<Carro>> findAllByTipo(String tipo) async {
    final dbClient = await db;

    final list = await dbClient.rawQuery('select * from carro where tipo =? ',[tipo]);

    return list.map<Carro>((json) => fromMap(json)).toList();
  }
}
