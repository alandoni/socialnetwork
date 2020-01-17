import 'user.dart';
import 'login.dart';

abstract class UserRepository {
  Future<User> store(User user);
  Future<User> login(Login login);
  Future<List<User>> retrieveAll();
}