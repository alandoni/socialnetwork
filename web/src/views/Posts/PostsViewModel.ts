import ViewModel from "../ViewModel";
import Post from "../../domain/post/Post";
import PostRepositoryImpl from "../../data/PostRepositoryImpl";
import PostService from "../../data/PostService";
import PostRepository from "../../domain/post/PostRepository";
import GetAllPostsUseCase from "../../domain/user/usecases/GetAllPostsUseCase";
import CreatePostUseCase from "../../domain/user/usecases/CreatePostUseCase";
import GetLoggedUserUseCase from "../../domain/post/usecases/GetLoggedUserUseCase";
import UserRepositoryImpl from "../../data/UserRepositoryImpl";
import UserService from "../../data/UserService";
import Reaction from "../../domain/post/Reaction";
import ReactToPostUseCase from "../../domain/user/usecases/ReactToPostUseCase";

export type State = {
    loading: boolean;
    posts: Array<Post> | null;
    post: string;
}

export class PostsViewModel extends ViewModel {
    postRepository: PostRepository;

    constructor() {
        super();
        this.postRepository = new PostRepositoryImpl(new PostService());

        this.state = {
            loading: false,
            posts: null,
            post: '',
        }
    }

    async loadPosts() {
        let posts = await new GetAllPostsUseCase(this.postRepository).run();
        this.setState({
            posts,
        });
    }

    setPost = (post: string | null) => {
        this.setState({
            post,
        });
    }

    async createPost() {
        console.log(this.state);
        const user = await new GetLoggedUserUseCase(new UserRepositoryImpl(new UserService())).run();
        const post = new Post(
            null,
            user!,
            this.state.post,
            new Date().valueOf(),
            null
        );
        const result = await new CreatePostUseCase(this.postRepository).run(post);
        const array = this.state.posts || [];
        array.push(result);
        this.setState({
            posts: array,
        });
    }

    async reactToPost(post: Post, reactionType: string) {
        const user = await new GetLoggedUserUseCase(new UserRepositoryImpl(new UserService())).run();
        const reaction = new Reaction(
            post.id!,
            reactionType,
            user!,
            new Date().valueOf()
        )
        const result = await new ReactToPostUseCase(this.postRepository).run(reaction);
        const updatedPost = Post.fromJson(result);

        const postIndex = this.state.posts!.findIndex((existingPost: Post) => {
            return existingPost.id === post.id;
        });
        this.updatePostAtIndex(postIndex, updatedPost);
    }

    updatePostAtIndex(postIndex: number, updatedPost: Post) {
        const array = this.state.posts!;
        array[postIndex] = updatedPost;
        this.setState({
            posts: array,
        });
    }
}