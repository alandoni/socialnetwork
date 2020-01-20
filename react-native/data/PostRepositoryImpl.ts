import PostRepository from "../domain/post/PostRepository";
import Post from "../domain/post/Post";
import Reaction from "../domain/post/Reaction";
import PostService from "./PostService";

export default class PostRepositoryImpl implements PostRepository {
    postService: PostService;

    constructor(postService: PostService) {
        this.postService = postService;
    }

    async getAll(): Promise<[Post]> {
        return await this.postService.getAll();
    }
    
    async createPost(post: Post): Promise<Post> {
        return await this.postService.createPost(post);
    }

    async reactToPost(reaction: Reaction): Promise<Post> {
        return await this.postService.reactToPost(reaction);
    }


}