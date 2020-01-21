import 'package:SocialNetwork/domain/post/reaction.dart';

import '../user/user.dart';
import '../codable.dart';

class Post extends Codable {
  String id;
  User user;
  String text;
  int date;
  Map<ReactionType, int> reactions;

  Post({this.user, this.text, this.date});

  Post.fromJson(Map<String, dynamic> json) {
    id = json["id"].toString();
    user = User.fromJson(json["user"]);
    text = json["text"];
    date = json["date"];
    Map rawReactions = json["reactions"];
    Map<ReactionType, int> map = rawReactions.map((key, value) {
      return MapEntry<ReactionType, int>(Reaction.stringToReactionType(key), value);
    });

    reactions = map;
  }

  @override
  Map<String, dynamic> toJson() {
    Map<String, int> rawReactions = reactions.map((key, value) {
      return MapEntry<String, int>(Reaction.reactionTypeToString(key), value);
    });

    final result = {
      "id": id,
      "user": user.toJson(),
      "text": text,
      "date": date,
      "reactions": rawReactions,
    };
    return result;
  }
}
