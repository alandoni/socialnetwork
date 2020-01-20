import React from 'react';
import { ActivityIndicator, View } from "react-native";

import GetLoggedUserUseCase from '../../domain/user/usecases/GetLoggedUserUseCase';
import MobileUserRepository from '../../data/MobileUserRepository';
import UserService from '../../data/UserService';
import { NavigationStackScreenProps } from 'react-navigation-stack';
import { Styles } from '../Styles';

export default class AuthLoadingScreen extends React.Component<NavigationStackScreenProps> {
    componentDidMount() {
        this.checkLogin();
    }

    async checkLogin() {
        const repository = new MobileUserRepository(new UserService());
        const user = await new GetLoggedUserUseCase(repository).run();
        this.props.navigation.navigate(user != null ? 'App' : 'Auth');
    }

    render() {
        return (
            <View style={Styles.container}>
                <ActivityIndicator />
            </View>
        );
    }
}