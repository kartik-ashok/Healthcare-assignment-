import 'package:healthcare_assignment/data/model/user_model.dart';
import 'package:healthcare_assignment/data/network/api_endpoints.dart';

class UserRepository {
  final ApiService _apiService = ApiService();

  Future<UserModel> loginUser(String email, String password) {
    return _apiService.login(email, password);
  }

  Future<UserModel> userPosts() {
    return _apiService.userPosts();
  }
}
