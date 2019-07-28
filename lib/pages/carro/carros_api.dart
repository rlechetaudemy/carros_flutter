
import 'package:carros/pages/carro/carro.dart';

class CarrosApi {
  static Future<List<Carro>> getCarros() async {
    final carros = List<Carro>();

    await Future.delayed(Duration(seconds: 2));

    carros.add(Carro(nome: "AUDI GT Spyder",urlFoto: "http://www.livroandroid.com.br/livro/carros/esportivos/Audi_Spyder.png"));
    carros.add(Carro(nome: "Porsche Panamera",urlFoto: "http://www.livroandroid.com.br/livro/carros/esportivos/Porsche_Panamera.png"));
    carros.add(Carro(nome: "Lamborghini Aventador",urlFoto: "http://www.livroandroid.com.br/livro/carros/esportivos/Lamborghini_Aventador.png"));

    return carros;
  }
}