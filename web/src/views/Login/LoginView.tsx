import React from 'react';
import LoginInput from './LoginInput';
import { RouteComponentProps, withRouter } from 'react-router-dom';
import { Alert, Container, Row, Col, Button } from 'react-bootstrap';
import { State, LoginViewModel } from './LoginViewModel';
import { ViewModelComponent } from '../ViewModel';

interface Props extends RouteComponentProps { }

class LoginView extends ViewModelComponent<LoginViewModel, Props, State> {
    constructor(props: any) {
        super(props, new LoginViewModel());
        this.viewModel.onLogin = this.onLogin;
    }

    onLogin = () => {
        this.props.history.push("/posts");
    }

    render() {
        return (
            <Container>
                <Row className="justify-content-md-center">
                    <Col md={6} className="login-container">
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
                                    onChange={this.viewModel.setUserName} />
                            </Col>
                        </Row>
                        <Row>
                            <Col>
                                <LoginInput 
                                    label="Senha"
                                    type="email"
                                    value={this.state.password}
                                    onChange={this.viewModel.setPassword} />
                            </Col>
                        </Row>
                        <Row>
                            <Col className="d-flex justify-content-center">
                                <Button 
                                    variant="primary" 
                                    onClick={() => this.viewModel.login()}>
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
