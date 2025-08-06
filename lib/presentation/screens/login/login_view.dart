import 'package:flutter/material.dart';
import 'package:healthcare_assignment/presentation/screens/login/login_viewmodel.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<LoginViewModel>(context);

    return Scaffold(
      body: Column(
        children: [
          const TextField(), // Email
          const TextField(), // Password
          ElevatedButton(
            onPressed: () {
              viewModel.login("test@example.com", "password123");
            },
            child: viewModel.isLoading
                ? const CircularProgressIndicator()
                : const Text("Login"),
          ),
        ],
      ),
    );
  }
}
