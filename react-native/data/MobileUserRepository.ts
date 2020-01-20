// Reusing class from web
import UserRepositoryImpl from '../data/UserRepositoryImpl'
import User from '../domain/user/User';
import { AsyncStorage } from 'react-native';

export default class MobileUserRepository extends UserRepositoryImpl {
    async getLoggedUser(): Promise<User> {
        const userJson = await AsyncStorage.getItem(this.LOGGED_USER);
        if (userJson) {
            let user = JSON.parse(userJson);
            return user;
        } else {
            return null;
        }
    }

    async setLoggedUser(user: User): Promise<void> {
        return await AsyncStorage.setItem(this.LOGGED_USER, JSON.stringify(user));
    }
}