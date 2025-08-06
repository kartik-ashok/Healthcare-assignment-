import 'dart:convert';

import 'package:healthcare_assignment/data/model/user_model.dart';
import 'package:healthcare_assignment/data/network/api_client.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<UserModel> login(String email, String password) async {
    // Use http or dio to call API
    final response = await http.post(
      Uri.parse(ApiEndpoints.login),
      body: {'email': email, 'password': password},
    );
    if (response.statusCode == 200) {
      return UserModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Login failed");
    }
  }
}
