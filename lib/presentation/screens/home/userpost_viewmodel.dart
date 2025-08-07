import 'package:flutter/foundation.dart';
import 'package:healthcare_assignment/data/model/user_model.dart';
import 'package:healthcare_assignment/data/repository/user_repository.dart';

class UserpostViewmodel extends ChangeNotifier {
  final UserRepository _repo = UserRepository();

  bool isLoading = false;
  UserModel? user;

  Future<void> userPosts() async {
    isLoading = true;
    notifyListeners();

    try {
      user = await _repo.userPosts();
    } catch (e) {
      print("Login failed: $e");
    }

    isLoading = false;
    notifyListeners();
  }
}
