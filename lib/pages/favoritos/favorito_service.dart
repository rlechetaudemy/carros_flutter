import 'package:carros/pages/carros/carro.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FavoritoService {
  CollectionReference get _carros => Firestore.instance.collection("carros");

  Stream<QuerySnapshot> get stream => _carros.snapshots();

  Future<bool> favoritar(Carro carro) async {

    var document = _carros.document("${carro.id}");
    var documentSnapshot = await document.get();

    if (!documentSnapshot.exists) {
      print("${carro.nome}, adicionado nos favoritos");
      document.setData(carro.toMap());

      return true;
    } else {
      print("${carro.nome}, removido nos favoritos");
      document.delete();

      return false;
    }
  }

  Future<bool> isFavorito(Carro carro) async {
    // Busca o carro no Firestore
    var document = _carros.document("${carro.id}");

    var documentSnapshot = await document.get();

    // Verifica se o carro está favoritado
    return documentSnapshot.exists;
  }
}
