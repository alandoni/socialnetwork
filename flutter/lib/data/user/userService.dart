import 'dart:convert';
import '../httpClient.dart';
import '../../domain/user/login.dart';
import '../../domain/user/user.dart';

class UserService {
  Future<User> login(Login login) async {
    HttpClient client = HttpClient();
    Map<String, dynamic> response = await client.post("/login", json.encode(login.toJson()));
    return User.fromJson(response);
  }
}