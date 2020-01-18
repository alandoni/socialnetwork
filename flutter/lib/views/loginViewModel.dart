import 'package:flutter/material.dart';
import '../data/database.dart';
import '../data/user/userDao.dart';
import '../data/user/userRepository.dart';
import '../data/user/userService.dart';
import '../domain/user/usecases/getAllUsersUseCase.dart';
import '../domain/user/usecases/loginUseCase.dart';
import '../domain/user/login.dart';
import '../domain/user/user.dart';
import 'bindingTextField.dart';

class LoginViewModel extends ChangeNotifier {
  Binding<String> email = Binding.initialValue("");
  Binding<String> password = Binding.initialValue("");
  String error;
  Function goToNextScreen;

  UserRepositoryImpl userRepository;

  LoginViewModel() {
    userRepository = UserRepositoryImpl(UserDao(AppDatabase()), UserService());
  }

  void loadData() async {
    try {
      List<User> users = await GetAllUsersUseCase(userRepository).run();
      if (users != null && users.length > 0) {
        setLoggedUserAndProccedToNextScreen(users[0]);
      }
    } catch (error) {
      this.error = error.message;
    }
  }

  void setLoggedUserAndProccedToNextScreen(User user) {
    User.currentUser = user;
    goToNextScreen();
  }

  void doLogin() async {
    Login login = Login(username: this.email.value.trim(), password: this.password.value.trim());
    try {
      User loggedUser = await LoginUseCase(userRepository).run(login);
      setLoggedUserAndProccedToNextScreen(loggedUser);
    } catch (error) {
      this.error = error.message;
      notifyListeners();
    }
  }
}