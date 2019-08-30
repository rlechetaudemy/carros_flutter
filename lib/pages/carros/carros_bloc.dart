
import 'dart:async';

import 'package:carros/pages/carros/carro.dart';
import 'package:carros/pages/carros/carro_dao.dart';
import 'package:carros/pages/carros/carros_api.dart';
import 'package:carros/utils/network.dart';

class CarrosBloc {

  final _streamController = StreamController<List<Carro>>();

  Stream<List<Carro>> get stream => _streamController.stream;

  Future<List<Carro>> fetch(String tipo) async {
    try {

      if(! await isNetworkOn()) {
        // Busca do banco de dados
        List<Carro> carros =  await CarroDAO().findAllByTipo(tipo);
        _streamController.add(carros);
        return carros;
      }

      List<Carro> carros = await CarrosApi.getCarros(tipo);

      if(carros.isNotEmpty) {
        final dao = CarroDAO();

        // Salvar todos os carros
        carros.forEach(dao.save);
      }

      _streamController.add(carros);

      return carros;
    } catch (e) {
      print(e);
      if(! _streamController.isClosed) {
        _streamController.addError(e);
      }
    }
  }

  void dispose() {
    _streamController.close();
  }
}