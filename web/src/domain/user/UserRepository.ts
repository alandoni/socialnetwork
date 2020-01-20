import User from "./User";
import Login from "./Login";

export default interface UserRepository {
    getLoggedUser(): Promise<User | null>;
    login(login: Login): Promise<User>;
    setLoggedUser(user: User): Promise<void>;
}