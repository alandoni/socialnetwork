import React from 'react';
import { Styles } from '../Styles';
import { Text, View } from 'react-native';
import { ReactionType } from '../../domain/post/Reaction';
import Post from '../../domain/post/Post';
import { TouchableNativeFeedback, TouchableWithoutFeedback } from 'react-native-gesture-handler';

type Props = {
    post: Post
    reactions: Map<string, number> | null
    onReact: Function
}

export default class ReactionView extends React.Component<Props> {
    onClickReaction(type: string) {
        this.props.onReact(this.props.post, type);
    }

    stringForReactionType(type: string): string {
        switch (type) {
            case ReactionType.REACTION_LIKE:
                return 'Gostei';
            default:
                return 'Não gostei';
        }
    }

    renderViewType(type: string) {
        const reactions = this.props.reactions;
        return (
            <View style={Styles.fill}>
                <View style={{ ...Styles.horizontal, ...Styles.centerContent }}>
                    <TouchableWithoutFeedback
                        onPress={() => this.onClickReaction(type)}>
                        <Text style={{ ...Styles.fill, ...Styles.primaryText }}>
                            {this.stringForReactionType(type)}
                        </Text>
                    </TouchableWithoutFeedback>
                    <Text>
                        : {(reactions && reactions.get(type)) || 0}
                    </Text>
                </View>
            </View>
        );
    }

    render() {
        return (
            <View style={{ ...Styles.horizontal, ...Styles.marginTop }}>
                {this.renderViewType(ReactionType.REACTION_LIKE)}
                {this.renderViewType(ReactionType.REACTION_DISLIKE)}
            </View>
        )
    }
}