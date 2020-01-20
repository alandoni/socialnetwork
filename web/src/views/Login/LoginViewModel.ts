import UserRepository from '../../domain/user/UserRepository';
import UserService from '../../data/UserService';
import UserRepositoryImpl from '../../data/UserRepositoryImpl';
import Login from '../../domain/user/Login';
import LoginUseCase from '../../domain/user/usecases/LoginUseCase';
import ViewModel from '../ViewModel';

export type State = {
    name: string;
    password: string;
    error: string | null;
    loading: boolean;
}

export class LoginViewModel extends ViewModel {
    onLogin: Function | null = null;
    userRepository: UserRepository;

    constructor() {
        super();
        this.userRepository = new UserRepositoryImpl(new UserService());
        this.state = {
            name: '',
            password: '',
            error: null,
            loading: false,
        }
    }

    async login() {
        const login = new Login(this.state.name, this.state.password);
        try {
            const user = await new LoginUseCase(this.userRepository).run(login);
            console.log(user);
            if (this.onLogin) {
                this.onLogin();
            }
        } catch (e) {
            console.log(e);
            this.setState({
                error: e.message,
            });
        }
    }

    setUserName = (newUsername: string) => {
        this.setState({
            name: newUsername,
        });
    }

    setPassword = (newPassword: string) => {
        this.setState({
            password: newPassword,
        });
    }
}