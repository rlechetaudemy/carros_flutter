
import 'dart:async';

import 'package:carros/firebase/firebase_service.dart';
import 'package:carros/pages/api_response.dart';

class LoginBloc {
  final _streamController = StreamController<bool>();

  get stream => _streamController.stream;

  Future<ApiResponse> login(String login, String senha) async {

    _streamController.add(true);

//    ApiResponse response = await LoginApi.login(login, senha);
    ApiResponse response = await FirebaseService().login(login, senha);

    _streamController.add(false);

    return response;
  }

  void dispose() {
    _streamController.close();
  }
}