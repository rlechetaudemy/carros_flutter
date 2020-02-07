
import 'dart:async';

import 'package:carros/pages/carros/carro.dart';
import 'package:carros/pages/carros/carro_dao.dart';
import 'package:carros/pages/carros/carros_api.dart';

import 'package:carros/utils/simple_bloc.dart';

class CarrosBloc extends SimpleBloc<List<Carro>>{

  Future<List<Carro>> fetch(String tipo) async {
    try {
      List<Carro> carros = await CarrosApi.getCarros(tipo);

      add(carros);

      // Salvar todos os carros no banco
      final dao = CarroDAO();
      carros.forEach(dao.save);

      return carros;
    } catch (e) {
      addError(e);
    }
  }
}