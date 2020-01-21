
import '../codable.dart';
import 'post.dart';
import '../user/user.dart';

class Reaction extends Codable {
  int id;
  Post post;
  ReactionType reactionType;
  User user;
  int date;

  Reaction(Post post, ReactionType reactionType, User user, int date) {
    this.post = post;
    this.reactionType = reactionType;
    this.user = user;
    this.date = date;
  }

  Reaction.fromJson(Map<String, dynamic> json) :
    id = json["id"],
    post = Post.fromJson(json["post"]),
    reactionType = stringToReactionType(json["reactionType"]),
    user = User.fromJson(json["user"]),
    date = json["date"],
    super.fromJson(json);

  @override
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "post": post.toJson(),
      "reactionType": reactionTypeToString(reactionType),
      "user": user.toJson(),
      "date": date
    };
  }

  static String reactionTypeToString(ReactionType reactionType) {
    switch (reactionType) {
      case ReactionType.REACTION_LIKE:
        return "like";
      default:
        return "dislike";
    }
  }

  static ReactionType stringToReactionType(String type) {
    switch (type) {
      case "like":
        return ReactionType.REACTION_LIKE;
      case "dislike":
        return ReactionType.REACTION_DISLIKE;
      default:
        throw Exception("ReactionType not found");
    }
  }
}

enum ReactionType {
  REACTION_LIKE,
  REACTION_DISLIKE
}
