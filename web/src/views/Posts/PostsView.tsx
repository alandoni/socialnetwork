import React from 'react';
import User from '../../models/User';
import Post from '../../models/Post';
import PostView from './PostView';
import Axios from 'axios';
import Reaction from '../../models/Reaction';

type Props = {
    loggedUser: User,
}

type State = {
    posts: Array<Post> | null,
    post: string,
}

export default class PostsView extends React.Component<Props, State> {
    constructor(props: any) {
        super(props);

        this.state = {
            posts: null,
            post: '',
        }
    }

    componentDidMount() {
        this.loadPosts();
    }

    loadPosts = async () => {
        const posts = await Axios.get('http://localhost:8080/post');
        const array = posts.data.map((post: any) => {
            return Post.fromJson(post);
        });
        this.setState({
            posts: array,
        });
    }

    changePostText = (e: any) => {
        const value = e.target.value;
        this.setState({
            post: value,
        });
    }

    createPost = async () => {
        const post = new Post(
            null,
            this.props.loggedUser,
            this.state.post,
            new Date().valueOf(),
            null
        );
        const result = await Axios.post('http://localhost:8080/post', post);
        const array = this.state.posts || [];
        array.push(result.data);
        this.setState({
            posts: array,
        });
    }

    reactToPost = async (post: Post, reactionType: string) => {
        const url = `http://localhost:8080/post/${post.id}/reaction`;
        const reaction = new Reaction(
            post.id!,
            reactionType,
            this.props.loggedUser,
            new Date().valueOf()
        )
        const result = await Axios.post(url, reaction);
        const updatedPost = Post.fromJson(result.data);

        const postIndex = this.state.posts!.findIndex((existingPost) => {
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

    renderPost(post: Post, index: number) {
        return (
            <PostView key={index} post={post} onReact={this.reactToPost} />
        )
    }
    
    renderPosts() {
        if (this.state.posts) {
            return this.state.posts.map((post, index) => {
                return this.renderPost(post, index);
            });
        } else {
            return <div>Nenhum post encontrado</div>
        }
    }

    render() {
        return (
            <div>
                <div>
                    Olá, {this.props.loggedUser.name}
                </div>
                <div>
                    <h1>No que está pensando?</h1>
                    <input value={this.state.post} onChange={this.changePostText}></input>
                    <button onClick={this.createPost}>Enviar</button>
                </div>
                <div>
                    <h1>Posts:</h1>
                    <div>
                        {this.renderPosts()}
                    </div>
                </div>
            </div>
        )
    }
}