import UserRepository from "../UserRepository";
import User from "../User";
import Login from "../Login";

export default class LoginUseCase {
    userRepository: UserRepository;

    constructor(userRepository: UserRepository) {
        this.userRepository = userRepository;
    }

    async run(login: Login): Promise<User> {
        return await this.userRepository.login(login);
    }
}