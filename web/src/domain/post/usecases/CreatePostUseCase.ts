import Post from "../Post";
import PostRepository from "../PostRepository";

export default class CreatePostUseCase {
    postRepository: PostRepository;

    constructor(postRepository: PostRepository) {
        this.postRepository = postRepository;
    }

    async run(post: Post): Promise<Post> {
        return await this.postRepository.createPost(post);
    }
}