import React from 'react';
import './App.css';
import LoginView from '../Login/LoginView';
import PostsView from '../Posts/PostsView';
import User from '../../models/User';

type Props = {

}
type State = {
  isLoggedIn: boolean;
  loggedUser: User | null;
}

export default class App extends React.Component<Props, State> {
  constructor(props: any) {
    super(props);
    this.state = {isLoggedIn: false, loggedUser: null};
  }

  onLoginSuccess = (user: User) => {
    this.setState({
      isLoggedIn: true,
      loggedUser: user,
    });
  }

  renderLogin() {
    return <LoginView onLoginSuccess={this.onLoginSuccess}/>
  }

  renderPosts() {
    return (
      <PostsView loggedUser={this.state.loggedUser!} />
    );
  }

  renderContent() {
    if (this.state.isLoggedIn) {
      return this.renderPosts();
    } else {
      return this.renderLogin();
    }
  }

  render() {
    return (
      <div className="App">
        {this.renderContent()}
      </div>
    );
  }
}