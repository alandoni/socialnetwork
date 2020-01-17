import '../codable.dart';

class Login extends Codable {
  String username;
  String password;

  Login({this.username, this.password});

  Login.fromJson(Map<String, dynamic> json) : 
    username = json["username"],
    password = json["password"],
    super.fromJson(json);

  @override
  Map<String, dynamic> toJson() {
    return {
      "username": username,
      "password": password,
    };
  }
}
