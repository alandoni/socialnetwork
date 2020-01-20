import User from "../domain/user/User";
import Login from "../domain/user/Login";
import Axios from "axios";
import Service from "./Service";

export default class UserService extends Service {
    async login(login: Login): Promise<User> {
        const user = await Axios.post(`${this.HOST}/login`, login);
        return user.data;
    }
}