import 'userDao.dart';
import 'userService.dart';
import '../../domain/user/login.dart';

import '../../domain/user/user.dart';

import '../../domain/user/userRepository.dart';

class UserRepositoryImpl implements UserRepository {

  UserDao userDao;
  UserService userService;

  UserRepositoryImpl(UserDao userDao, UserService userService) {
    this.userDao = userDao;
    this.userService = userService;
  }

  @override
  Future<User> login(Login login) {
    return null;
  }

  @override
  Future<List<User>> retrieveAll() {
    return null;
  }

  @override
  Future<User> store(User user) {
    return null;
  }
}