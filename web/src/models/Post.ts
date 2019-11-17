import User from "./User";

export default class Post {
    id: string | null;
    user: User;
    text: string;
    date: number;
    reactions: Map<string, number> | null;
    
    constructor(id: string | null, user: User, text: string, date: number, reactions: Map<string, number> | null) {
        this.id = id;
        this.user = user;
        this.text = text;
        this.date = date;
        this.reactions = reactions;
    }

    static fromJson(object: any): Post {
        const map: Map<string, number> = new Map();
        Object.entries(object.reactions || {}).forEach((entries: Array<any>) => {
            const key: string = entries[0];
            map.set(key, entries[1]);
        });
        return new Post(object.id,
            object.user,
            object.text,
            object.date,
            map,
        )
    }
}