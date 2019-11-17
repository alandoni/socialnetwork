import React from 'react';
import Post from '../../models/Post';
import ReactionView from './ReactionView'

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
            <div>
                <p>{this.props.post.user.name} - {this.renderDate()}</p>
                <p>{this.props.post.text}</p>
                <ReactionView 
                    post={this.props.post} 
                    reactions={this.props.post.reactions}
                    onReact={this.props.onReact} />
            </div>
        )
    }
}