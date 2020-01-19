import React from 'react';
import User from '../../models/User';
import Post from '../../models/Post';
import PostView from './PostView';
import Axios from 'axios';
import Reaction from '../../models/Reaction';
import { Container, Form, Button, Row, Alert } from 'react-bootstrap';
import { Col } from 'react-bootstrap';

type Props = { }

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
            User.loggedUser,
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
            User.loggedUser,
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
            return <Row className="login-container">
                <Col>
                    <Alert variant="warning">Nenhum post encontrado</Alert>
                </Col>
            </Row>
        }
    }

    render() {
        return (
            <Container>
                <Row className="login-container">
                    <Col>
                        <Form>
                            <Form.Group>
                                <Row>
                                    <Col>
                                        <Form.Label>No que está pensando?</Form.Label>
                                    </Col>
                                </Row>
                                <Row>
                                    <Col>
                                        <Form.Control as="textarea" rows={3} value={this.state.post} onChange={this.changePostText}/>
                                    </Col>
                                    <Col xs={1}>
                                        <Button 
                                            className="full-height"
                                            onClick={this.createPost}>
                                                Enviar
                                        </Button>
                                    </Col>
                                </Row>
                            </Form.Group>              
                        </Form>
                    </Col>
                </Row>
                <Row>
                    <Col>
                        {this.renderPosts()}
                    </Col>
                </Row>
            </Container>
        )
    }
}