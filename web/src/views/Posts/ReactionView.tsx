import React from 'react';
import Post from '../../models/Post';
import { ReactionType } from '../../models/Reaction';
import { Row, Col } from 'react-bootstrap';

type Props = {
    post: Post
    reactions: Map<string, number> | null
    onReact: Function
}

export default class ReactionView extends React.Component<Props> {
    onClickReaction(type: string) {
        this.props.onReact(this.props.post, type);
    }

    stringForReactionType(type: string) {
        switch (type) {
            case ReactionType.REACTION_LIKE:
                return 'Gostei';
            default:
                return 'Não gostei';
        }
    }

    renderViewType(type: string) {
        const reactions = this.props.reactions;
        return (<span>
            <a onClick={() => this.onClickReaction(type)}>
                {this.stringForReactionType(type)}
            </a>
            : {(reactions && reactions.get(type)) || 0}
            </span>
        );
    }

    render() {
        return (
            <Row>
                <Col className="reactions-view d-flex justify-content-center text-primary">
                    {this.renderViewType(ReactionType.REACTION_LIKE)}
                </Col>
                <Col className="reactions-view d-flex justify-content-center text-primary">
                    {this.renderViewType(ReactionType.REACTION_DISLIKE)}
                </Col>
            </Row>
        )
    }
}