import React from 'react';
import Post from '../../domain/post/Post';
import PostView from './PostView';
import { Container, Form, Button, Row, Alert } from 'react-bootstrap';
import { Col } from 'react-bootstrap';
import { ViewModelComponent } from '../ViewModel';
import { PostsViewModel, State } from './PostsViewModel';

type Props = { }

export default class PostsView extends ViewModelComponent<PostsViewModel, Props, State> {
    constructor(props: any) {
        super(props, new PostsViewModel());
    }

    componentDidMount() {
        this.viewModel.loadPosts();
    }

    renderPost(post: Post, index: number) {
        return (
            <PostView 
                key={index} 
                post={post}
                onReact={(post: Post, reaction: string) => this.viewModel.reactToPost(post, reaction)} />
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
                                        <Form.Control 
                                            as="textarea" 
                                            rows={3} 
                                            onChange={(e: any) => this.viewModel.setPost(e.target.value)}
                                            value={this.state.post} />
                                    </Col>
                                    <Col xs={1}>
                                        <Button 
                                            className="full-height"
                                            onClick={() => this.viewModel.createPost()}>
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