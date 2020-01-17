import '../userRepository.dart';

import '../user.dart';

class StoreUserUseCase {
  UserRepository userRepository;

  StoreUserUseCase(UserRepository userRepository) {
    this.userRepository = userRepository;
  }

  Future<User> run(User user) {
    return userRepository.store(user);
  }
}