import React from 'react';
import LoginInput from './LoginInput';
import axios from 'axios';
import Login from '../../models/Login';
import User from '../../models/User';
import { RouteComponentProps, withRouter } from 'react-router-dom';
import { Alert, Container, Row, Col, Button } from 'react-bootstrap';

interface Props extends RouteComponentProps { }

type State = {
    name: string;
    password: string;
    error: string | null;
}

class LoginView extends React.Component<Props, State> {
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
            User.loggedUser = user.data;
            this.props.history.push('/posts');
        } catch (e) {
            console.log(e);
            this.setState({
                error: e.message,
            });
        }
    }

    render() {
        return (
            <Container>
                <Row className="justify-content-md-center">
                    <Col xs={6} className="login-container">
                        <Row>
                            <Col className="d-flex justify-content-center">
                                <h2 className="text-primary">Login</h2>
                            </Col>
                        </Row>
                        { this.state.error ?
                            <Alert variant="danger">{this.state.error}</Alert>
                        : null }
                        <Row>
                            <Col>
                                <LoginInput 
                                    label="Usuário" 
                                    type="email"
                                    value={this.state.name} 
                                    onChange={this.onChangeUserName} />
                            </Col>
                        </Row>
                        <Row>
                            <Col>
                                <LoginInput 
                                    label="Senha"
                                    type="email"
                                    value={this.state.password}
                                    onChange={this.onChangePassword} />
                            </Col>
                        </Row>
                        <Row>
                            <Col className="d-flex justify-content-center">
                                <Button 
                                    variant="primary" 
                                    onClick={this.onClickLogin}>
                                        Entrar
                                </Button>
                            </Col>
                        </Row>
                    </Col>
                </Row>
            </Container>
        )
    }
}

export default withRouter(LoginView as any)
