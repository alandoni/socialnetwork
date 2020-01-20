import React from 'react';
import Post from '../../domain/post/Post';
import { View, Text } from 'react-native';
import { Styles } from '../Styles';
import ReactionView from './ReactionView';

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
            <View style={Styles.section}>
                <View style={Styles.horizontal}>
                    <Text style={{ ...Styles.primaryText, ...Styles.fill }}>
                        {this.props.post.user.name}
                    </Text>
                    <Text>
                        {this.renderDate()}
                    </Text>
                </View>
                <View style={Styles.hr} />
                <Text style={{ ...Styles.text, ...Styles.marginTop }}>
                    {this.props.post.text}
                </Text>
                <View style={Styles.hr} />
                <ReactionView 
                    post={this.props.post}
                    reactions={this.props.post.reactions}
                    onReact={this.props.onReact} />
            </View>
        )
    }
}