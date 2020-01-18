import 'package:http/http.dart' as http;
import 'dart:convert';

class HttpClient {
  static const String URL = "http://192.168.15.17:8080";

  Future<dynamic> get(String url) async {
    final response = await http.get("$URL$url");
    return handleResponse(response);
  }

  dynamic handleResponse(http.Response response) {
    if (response.statusCode > 199 && response.statusCode < 300) {
      return json.decode(response.body);
    } else {
      int code = response.statusCode;
      String error = response.body;
      if (code == 404) {
        error = "Not found";
      }
      throw Exception("$code - $error");
    }
  }

  Future<dynamic> post(String endpoint, String body) async {
    final response = await http.post("$URL$endpoint", headers: { "content-type": "application/json" }, body: body);
    return handleResponse(response);
  }
}
