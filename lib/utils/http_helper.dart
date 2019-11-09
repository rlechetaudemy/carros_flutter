import 'package:http/http.dart' as http;

Future<http.Response> get(String url) async {
  final headers = await _headers();
  var response = await http.get(url, headers: headers);
  return response;
}

Future<http.Response> post(String url, {body}) async {
  final headers = await _headers();
  var response = await http.post(url, body: body, headers: headers);
  return response;
}

Future<http.Response> put(String url, {body}) async {
  final headers = await _headers();
  var response = await http.put(url, body: body, headers: headers);
  return response;
}

Future<http.Response> delete(String url) async {
  final headers = await _headers();
  var response = await http.delete(url, headers: headers);
  return response;
}

Future<Map<String, String>> _headers() async {
//  Usuario user = await Usuario.get();

  Map<String, String> headers = {
    "Content-Type": "application/json",
   // "Authorization": "Bearer ${user.token}"
  };
  return headers;
}
