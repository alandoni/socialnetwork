import React from 'react';
import './App.css';
import LoginView from '../Login/LoginView';
import PostsView from '../Posts/PostsView';
import User from '../../models/User';
import {
    Switch,
    Route,
    Redirect,
    BrowserRouter,
} from "react-router-dom";

type Props = {
    isAuthenticated: Function,
    path: string,
    component: JSX.Element,
};

type State = {
    isLoggedIn: boolean;
    loggedUser: User | null;
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
    constructor(props: any) {
        super(props);
        this.state = { isLoggedIn: false, loggedUser: null };
    }

    isAuthenticated = () => {
        return User.loggedUser
    }

    render() {
        return (
            <BrowserRouter>
                <Switch>
                    <Route path="/login" component={LoginView}>
                        <LoginView />
                    </Route>
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
            </BrowserRouter>
        );
    }
}