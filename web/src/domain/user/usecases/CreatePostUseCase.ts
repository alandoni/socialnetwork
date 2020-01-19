import Post from "../../post/Post";
import PostRepository from "../../post/PostRepository";

export default class CreatePostUseCase {
    postRepository: PostRepository;

    constructor(postRepository: PostRepository) {
        this.postRepository = postRepository;
    }

    async run(post: Post): Promise<Post> {
        return await this.postRepository.createPost(post);
    }
}