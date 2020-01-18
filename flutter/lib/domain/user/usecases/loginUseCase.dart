import '../userRepository.dart';

import '../login.dart';
import '../user.dart';

class LoginUseCase {
  UserRepository userRepository;

  LoginUseCase(UserRepository userRepository) {
    this.userRepository = userRepository;
  }

  Future<User> run(Login login) async {
    User user = await userRepository.login(login);
    await userRepository.store(user);
    return user;
  }
}