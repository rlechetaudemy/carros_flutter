import 'package:carros/pages/carro/carro.dart';
import 'package:carros/pages/carro/carros_api.dart';
import 'package:carros/utils/simple_bloc.dart';

class CarrosBloc extends SimpleBloc<List<Carro>> {

  fetch(String tipo) async {
    try {
      List<Carro> carros = await CarrosApi.getCarros(tipo);

      add(carros);
    } catch (e) {
      addError(e);
    }
  }
}