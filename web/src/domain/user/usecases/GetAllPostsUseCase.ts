import Post from "../../post/Post";
import PostRepository from "../../post/PostRepository";

export default class GetAllPostsUseCase {
    postRepository: PostRepository;

    constructor(postRepository: PostRepository) {
        this.postRepository = postRepository;
    }

    async run(): Promise<[Post]> {
        return await this.postRepository.getAll();
    }
}