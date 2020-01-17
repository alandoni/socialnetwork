import '../userRepository.dart';

import '../user.dart';

class GetAllUsersUseCase {
  UserRepository userRepository;

  GetAllUsersUseCase(UserRepository userRepository) {
    this.userRepository = userRepository;
  }

  Future<List<User>> run() {
    return userRepository.retrieveAll();
  }
}