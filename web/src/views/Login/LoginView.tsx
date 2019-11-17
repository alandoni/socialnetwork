import React from 'react';
import LoginInput from './LoginInput';
import axios from 'axios';
import Login from '../../models/Login';

type Props = {
    onLoginSuccess: Function
}

type State = {
    name: string;
    password: string;
    error: string | null;
}

export default class LoginView extends React.Component<Props, State> {
    constructor(props: any) {
        super(props);

        this.state = {
            name: '',
            password: '',
            error: null
        }
    }

    onChangeUserName = (newUsername: string) => {
        this.setState({
            name: newUsername,
        });
    }

    onChangePassword = (newPassword: string) => {
        this.setState({
            password: newPassword,
        });
    }

    onClickLogin = async () => {
        const login = new Login(this.state.name, this.state.password);
        try {
            const user = await axios.post('http://localhost:8080/login', login);
            console.log(user.data);
            this.props.onLoginSuccess(user.data);
        } catch (e) {
            console.log(e);
            this.setState({
                error: e.message,
            });
        }
    }

    render() {
        return (
            <div>
                <h1>Login</h1>
                <p>{this.state.error}</p>
                <LoginInput label="Usuário" value={this.state.name} onChange={this.onChangeUserName} />
                <LoginInput label="Senha" value={this.state.password} onChange={this.onChangePassword} />
                <button onClick={this.onClickLogin}>Entrar</button>
            </div>
        )
    }
}