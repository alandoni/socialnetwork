import React from 'react';
import { Text, View } from 'react-native';
import { NavigationStackScreenProps } from 'react-navigation-stack';
import { Styles } from '../Styles';
import { TouchableHighlight, TextInput } from 'react-native-gesture-handler';
import { ViewModelComponent } from '../ViewModel';
import { LoginViewModel, State } from './LoginViewModel';

export default class LoginView extends ViewModelComponent<LoginViewModel, NavigationStackScreenProps, State> {
    static navigationOptions = {
        title: 'Social Network',
        headerStyle: {
            backgroundColor: '#037afb'
        },
        headerTintColor: '#fff',
    }

    constructor(props) {
        super(props, new LoginViewModel());
        this.viewModel.onLogin = this.onLogin;
    }

    onLogin = () => {
        this.props.navigation.navigate('App');
    }

    render() {
        return (
            <View style={Styles.container}>
                <View style={Styles.section}>
                    <Text 
                        style={{ ...Styles.largeText, ...Styles.primaryText }}>
                        Login
                    </Text>

                    { this.state.error ? 
                        <Text style={Styles.errorText}>{this.state.error}</Text>
                    : null }

                    <Text style={Styles.text}>Usuário</Text>
                    <TextInput 
                        style={Styles.textField}
                        value={this.state.name}
                        onChangeText={this.viewModel.setUserName}/>

                    <Text style={Styles.text}>Senha</Text>
                    <TextInput 
                        style={Styles.textField}
                        value={this.state.password}
                        onChangeText={this.viewModel.setPassword}/>

                    <TouchableHighlight
                        style={Styles.button}
                        onPress={() => this.viewModel.login()}
                    >
                        <Text style={Styles.textButton}>Entrar</Text>
                    </TouchableHighlight>
                </View>
            </View>)
    }
}