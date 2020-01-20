import UserRepository from "../UserRepository";
import User from "../User";

export default class GetLoggedUserUseCase {
    userRepository: UserRepository;

    constructor(userRepository: UserRepository) {
        this.userRepository = userRepository;
    }

    async run(): Promise<User | null> {
        return await this.userRepository.getLoggedUser();
    }
}