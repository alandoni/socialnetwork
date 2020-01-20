import Post from "../Post";
import PostRepository from "../PostRepository";

export default class GetAllPostsUseCase {
    postRepository: PostRepository;

    constructor(postRepository: PostRepository) {
        this.postRepository = postRepository;
    }

    async run(): Promise<[Post]> {
        return await this.postRepository.getAll();
    }
}