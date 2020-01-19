import UserRepository from "../../user/UserRepository";
import User from "../../user/User";
import Login from "../../user/Login";

export default class LoginUseCase {
    userRepository: UserRepository;

    constructor(userRepository: UserRepository) {
        this.userRepository = userRepository;
    }

    async run(login: Login): Promise<User> {
        return await this.userRepository.login(login);
    }
}