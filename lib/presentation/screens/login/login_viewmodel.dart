import 'package:flutter/foundation.dart';
import 'package:healthcare_assignment/data/model/user_model.dart';
import 'package:healthcare_assignment/data/repository/user_repository.dart';

class LoginViewModel extends ChangeNotifier {
  final UserRepository _repo = UserRepository();

  bool isLoading = false;
  UserModel? user;

  Future<void> login(String email, String password) async {
    isLoading = true;
    notifyListeners();

    try {
      user = await _repo.loginUser(email, password);
    } catch (e) {
      print("Login failed: $e");
    }

    isLoading = false;
    notifyListeners();
  }
}
