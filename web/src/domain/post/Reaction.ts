import User from "../user/User";

export default class Reaction {
    postId: string;
    reactionType: string;
    user: User;
    date: number;

    constructor(postId: string, reactionType: string, user: User, date: number) {
        this.postId = postId;
        this.reactionType = reactionType;
        this.user = user;
        this.date = date;
    }
}

export class ReactionType {
    static REACTION_LIKE = "like";
    static REACTION_DISLIKE = "dislike";
}