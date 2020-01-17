import '../userRepository.dart';

import '../login.dart';
import '../user.dart';

class LoginUseCase {
  UserRepository userRepository;

  LoginUseCase(UserRepository userRepository) {
    this.userRepository = userRepository;
  }

  Future<User> run(Login login) {
    return userRepository.login(login);
  }
}