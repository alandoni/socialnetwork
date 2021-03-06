import React from 'react';
import './App.css';
import LoginView from '../Login/LoginView';
import PostsView from '../Posts/PostsView';
import {
    Switch,
    Route,
    Redirect,
    BrowserRouter,
} from "react-router-dom";
import NavBar from '../NavBar/NavBar';
import 'bootstrap/dist/css/bootstrap.min.css';
import GetLoggedUserUseCase from '../../domain/user/usecases/GetLoggedUserUseCase';
import UserRepositoryImpl from '../../data/UserRepositoryImpl';
import UserService from '../../data/UserService';

type Props = {
    isAuthenticated: Function,
    path: string,
    component: JSX.Element,
};

type State = {
    isLoggedIn: boolean;
};

class PrivateRoute extends React.Component<Props> {
    render() {
        if (!this.props.isAuthenticated()) {
            return (<Redirect to={this.props.path} />);
        } else {
            return (this.props.component)
        }
    }
}

type AppProps = {};

export default class App extends React.Component<AppProps, State> {
    hasBeenMounted: boolean;

    constructor(props: any) {
        super(props);
        this.state = { isLoggedIn: false };
        this.hasBeenMounted = false;
    }

    isAuthenticated = () => {
        let isAuth = !!new GetLoggedUserUseCase(new UserRepositoryImpl(new UserService())).run();
        return isAuth;
    }

    render() {
        return (
            <BrowserRouter>
                <div className="background">
                    <NavBar hasSearch={this.state.isLoggedIn} />
                    <Switch>
                        <Route path="/login" component={LoginView} />
                        <Route path="/">
                            <PrivateRoute
                                path="/login"
                                component={<PostsView />}
                                isAuthenticated={this.isAuthenticated} />
                        </Route>
                        <Route path="/posts">
                            <PrivateRoute
                                path="/login"
                                component={<PostsView />}
                                isAuthenticated={this.isAuthenticated} />
                        </Route>
                    </Switch>
                </div>
            </BrowserRouter>
        );
    }
}