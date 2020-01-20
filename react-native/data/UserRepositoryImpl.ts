import UserRepository from "../domain/user/UserRepository";
import User from "../domain/user/User";
import Login from "../domain/user/Login";
import UserService from "./UserService";

export default class UserRepositoryImpl implements UserRepository {
    userService: UserService;
    LOGGED_USER = "LOGGED_USER";

    constructor(userService: UserService) {
        this.userService = userService;
    }

    async getLoggedUser(): Promise<User | null> {
        let userJson = localStorage.getItem(this.LOGGED_USER);
        if (userJson) {
            let user = JSON.parse(userJson);
            return user;
        } else {
            return null;
        }
    }
    
    async login(login: Login): Promise<User> {
        let user = await this.userService.login(login);
        await this.setLoggedUser(user);
        return user;
    }

    async setLoggedUser(user: User): Promise<void> {
        return await localStorage.setItem(this.LOGGED_USER, JSON.stringify(user));
    }
}