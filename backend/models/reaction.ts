import User from "./user";

export default class Reaction {
    user: User;
    postId: string;
    date: number;
    reactionType: string;
}

export class ReactionType {
    static REACTION_LIKE = "like";
    static REACTION_DISLIKE = "dislike";
}