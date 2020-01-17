import '../codable.dart';

class User extends Codable {
  String id;
  String username;
  String email;
  
  User.fromJson(Map<String, dynamic> json) : 
    id = json["id"],
    username = json["username"],
    email = json["email"],
    super.fromJson(json);

  @override
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "username": username,
      "email": email
    };
  }

  static User currentUser;
}
