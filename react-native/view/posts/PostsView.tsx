import React from 'react';
import { Text, View, ListViewDataSource } from 'react-native';
import { NavigationStackScreenProps } from 'react-navigation-stack';
import { State, PostsViewModel } from './PostsViewModel';
import { ViewModelComponent } from '../ViewModel';
import { Styles } from '../Styles';
import { TextInput, TouchableHighlight, FlatList } from 'react-native-gesture-handler';
import Post from '../../domain/post/Post';
import PostView from './PostView';

export default class PostsView extends ViewModelComponent<PostsViewModel, NavigationStackScreenProps, State> {
    static navigationOptions = {
        title: 'Social Network',
        headerStyle: {
            backgroundColor: '#037afb'
        },
        headerTintColor: '#fff',
    }

    constructor(props) {
        super(props, new PostsViewModel());
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
            return (
                <FlatList
                    data={this.state.posts}
                    renderItem={(post) => { 
                        return this.renderPost(post.item, post.index);
                }}/>
            );
        } else {
            return <View style={Styles.section}>
                <Text style={Styles.warning}>Nenhum post encontrado</Text>
            </View>
        }
    }

    render() {
        return (
            <View>
                <View style={Styles.section}>
                    <Text style={Styles.text}>No que está pensando?</Text>
                    <View style={Styles.horizontal}>
                        <TextInput
                            style={{ ...Styles.textField, ...Styles.fill, ...Styles.marginRight }}
                            value={this.state.post}
                            multiline={true}
                            numberOfLines={3}
                            onChangeText={this.viewModel.setPost}/>
                        <TouchableHighlight
                                style={Styles.button}
                                onPress={() => this.viewModel.createPost()}
                            >
                                <Text style={Styles.textButton}>Enviar</Text>
                        </TouchableHighlight>
                    </View>
                </View>
                <View style={Styles.hr} />
                <View>
                    {this.renderPosts()}
                </View>
            </View>)
    }
}