import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class LoginApi {
  static Future<bool> login(String login, String senha) async {
    var url = 'https://carros-springboot.herokuapp.com/api/v2/login';

    Map<String,String> headers = {
      "Content-type": "application/json"
    };

    Map params = {
      "username": login,
      "password": senha
    };

    String json = convert.json.encode(params);
    print("> $json");

    var response = await http.post(url, body: json, headers: headers);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    return true;
  }
}
