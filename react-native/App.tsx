import { StyleSheet } from 'react-native';
import { createAppContainer, createSwitchNavigator } from 'react-navigation';
import { createStackNavigator } from 'react-navigation-stack';
import LoginView from './view/login/LoginView';
import PostsView from './view/posts/PostsView';
import AuthLoadingScreen from './view/login/AuthLoadingScreen';

const AppNavigator = createStackNavigator({ Home: PostsView });
const AuthStack = createStackNavigator({ Login: LoginView });

const LoginNavigator = createSwitchNavigator(
  {
    AuthLoading: AuthLoadingScreen,
    App: AppNavigator,
    Auth: AuthStack,
  },
  {
    initialRouteName: 'AuthLoading',
    defaultNavigationOptions: {
      headerStyle: {
          backgroundColor: '#037afb'
      },
      headerTintColor: '#fff',
    },
  }
)

export default createAppContainer(LoginNavigator)