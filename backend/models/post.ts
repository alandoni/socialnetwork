import User from "./user";
import { ReactionType } from "./reaction";

export default class Post {
    id: string;
    user: User;
    text: string;
    date: number;
    reactions: Map<string, number> = new Map();

    constructor(id: string, user: User, text: string, date: number) {
        this.id = id;
        this.user = user;
        this.text = text;
        this.date = date;
    }

    addReaction(reactionType: string) {
        let counter: number = this.reactions[reactionType] || 0;
        counter++;
        this.reactions[reactionType] = counter;
    }

    static fromJson(object: any): Post {
        return new Post(object.id, object.user, object.text, object.date);
    }
}