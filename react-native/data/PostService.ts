import Post from "../domain/post/Post";
import Axios from "axios";
import Reaction from "../domain/post/Reaction";
import Service from "./Service";

export default class PostService extends Service {
    async getAll(): Promise<[Post]> {
        const response = await Axios.get(`${this.HOST}/post`);
        return response.data.map((post: any) => {
            return Post.fromJson(post);
        });
    }

    async createPost(post: Post): Promise<Post> {
        const result = await Axios.post(`${this.HOST}/post`, post);
        return Post.fromJson(result.data);
    }

    async reactToPost(reaction: Reaction): Promise<Post> {
        const url = `${this.HOST}/post/${reaction.postId}/reaction`;
        const result = await Axios.post(url, reaction);
        return Post.fromJson(result.data);
    }
}