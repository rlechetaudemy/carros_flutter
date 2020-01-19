
import 'dart:async';

import 'package:carros/pages/carros/carro.dart';
import 'package:carros/pages/carros/carros_api.dart';
import 'package:carros/utils/simple_bloc.dart';

class CarrosBloc extends SimpleBloc<List<Carro>>{

  Future<List<Carro>> fetch(String tipo) async {
    try {
      List<Carro> carros = await CarrosApi.getCarros(tipo);

      add(carros);

      return carros;
    } catch (e) {
      addError(e);
    }

    return [];
  }
}