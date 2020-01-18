import '../user/user.dart';
import '../codable.dart';

class Post extends Codable {
  String id;
  User user;
  String text;
  int date;
  Map<String, dynamic> reactions;

  Post({this.user, this.text, this.date});

  Post.fromJson(Map<String, dynamic> json) : 
    id = json["id"].toString(),
    user = User.fromJson(json["user"]),
    text = json["text"],
    date = json["date"],
    reactions = json["reactions"],
    super.fromJson(json);

  @override
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "user": user.toJson(),
      "text": text,
      "date": date,
      "reactions": reactions
    };
  }
}
