import Post from "./Post";
import Reaction from "./Reaction";

export default interface PostRepository {
    getAll(): Promise<[Post]>;
    createPost(post: Post): Promise<Post>;
    reactToPost(reaction: Reaction): Promise<Post>;
}