import Post from "../Post";
import PostRepository from "../PostRepository";
import Reaction from "../Reaction";

export default class ReactToPostUseCase {
    postRepository: PostRepository;

    constructor(postRepository: PostRepository) {
        this.postRepository = postRepository;
    }

    async run(reaction: Reaction): Promise<Post> {
        return await this.postRepository.reactToPost(reaction);
    }
}