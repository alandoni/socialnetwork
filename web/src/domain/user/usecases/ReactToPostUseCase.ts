import Post from "../../post/Post";
import PostRepository from "../../post/PostRepository";
import Reaction from "../../post/Reaction";

export default class ReactToPostUseCase {
    postRepository: PostRepository;

    constructor(postRepository: PostRepository) {
        this.postRepository = postRepository;
    }

    async run(reaction: Reaction): Promise<Post> {
        return await this.postRepository.reactToPost(reaction);
    }
}