
import 'package:carros/pages/carros/carro.dart';
import 'package:carros/pages/favoritos/favorito_service.dart';
import 'package:flutter/material.dart';

class FavoritosModel extends ChangeNotifier {
  List<Carro> carros = [];

  Future<List<Carro>> getCarros() async {
    carros = await FavoritoService.getCarros();

    notifyListeners();

    return carros;
  }
}