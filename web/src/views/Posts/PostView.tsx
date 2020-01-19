import React from 'react';
import Post from '../../domain/post/Post';
import ReactionView from './ReactionView'
import { Row } from 'react-bootstrap';
import { Col } from 'react-bootstrap';

type Props = {
    post: Post,
    onReact: Function
}

export default class PostView extends React.Component<Props> {
    renderDate() {
        return new Date(this.props.post.date).toLocaleString()
    }

    render() {
        return (
            <Row className="login-container">
                <Col>
                    <Row>
                        <Col className="text-primary">
                            {this.props.post.user.name}
                        </Col>
                        <Col xs={2}>
                            {this.renderDate()}
                        </Col>
                    </Row>
                    <hr />
                    <Row>
                        <Col>
                            {this.props.post.text}
                        </Col>
                    </Row>
                    <hr />
                    <ReactionView 
                        post={this.props.post}
                        reactions={this.props.post.reactions}
                        onReact={this.props.onReact} />
                </Col>
            </Row>
        )
    }
}