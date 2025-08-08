import 'package:flutter/material.dart';
import 'package:healthcare_assignment/core/constants/app_sizes.dart';
import 'package:healthcare_assignment/core/constants/app_text_styles.dart';
import 'package:healthcare_assignment/data/firebase/auth_service.dart';
import 'package:healthcare_assignment/presentation/screens/pages/home_page.dart';
import 'package:healthcare_assignment/presentation/screens/pages/signup_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _authService = AuthService();

  // Sizes cached for performance
  late double fieldFontSize;
  late double buttonFontSize;
  late double fieldPaddingV;
  late double fieldPaddingH;
  late double buttonRadius;
  late double buttonPaddingV;
  late double shadowBlur;
  late double shadowOffset;

  bool _obscurePassword = true;
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    // Cache responsive sizes
    fieldFontSize = ResponsiveSize.font(14);
    buttonFontSize = ResponsiveSize.font(16);
    fieldPaddingV = ResponsiveSize.height(14);
    fieldPaddingH = ResponsiveSize.width(16);
    buttonRadius = ResponsiveSize.width(12);
    buttonPaddingV = ResponsiveSize.height(14);
    shadowBlur = ResponsiveSize.width(6);
    shadowOffset = ResponsiveSize.height(3);
  }

  void _showMessage(String message, {bool isError = true}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? Colors.redAccent : Colors.green,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  Future<void> _login() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      _showMessage("Please enter both email and password");
      return;
    }

    setState(() => _loading = true);

    String? result = await _authService.signIn(email, password);

    setState(() => _loading = false);

    if (result == null) {
      _showMessage("Login successful!", isError: false);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    } else {
      _showMessage(result);
    }
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    bool obscure = false,
    Widget? suffixIcon,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obscure,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: AppTextStyles.small1,
        filled: true,
        fillColor: Colors.grey[200],
        contentPadding: EdgeInsets.symmetric(
          vertical: fieldPaddingV,
          horizontal: fieldPaddingH,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(buttonRadius),
          borderSide: BorderSide.none,
        ),
        suffixIcon: suffixIcon,
      ),
    );
  }

  Widget _buildButton(String text, VoidCallback onTap) {
    return InkWell(
      borderRadius: BorderRadius.circular(buttonRadius),
      onTap: _loading ? null : onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: buttonPaddingV),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(buttonRadius),
          gradient: const LinearGradient(
            colors: [Color(0xFF4A90E2), Color(0xFF9013FE)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: shadowBlur,
              offset: Offset(0, shadowOffset),
            ),
          ],
        ),
        child: Center(
          child: _loading
              ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                      color: Colors.white, strokeWidth: 2),
                )
              : Text(
                  text,
                  style: AppTextStyles.heading2.copyWith(color: Colors.white),
                ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login", style: AppTextStyles.heading2),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(ResponsiveSize.width(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.health_and_safety,
                size: ResponsiveSize.width(80), color: Colors.blue),
            SizedBox(height: ResponsiveSize.height(30)),
            _buildTextField(
              controller: _emailController,
              label: "Email",
            ),
            SizedBox(height: ResponsiveSize.height(16)),
            _buildTextField(
              controller: _passwordController,
              label: "Password",
              obscure: _obscurePassword,
              suffixIcon: IconButton(
                icon: Icon(
                  _obscurePassword ? Icons.visibility_off : Icons.visibility,
                  color: Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    _obscurePassword = !_obscurePassword;
                  });
                },
              ),
            ),
            SizedBox(height: ResponsiveSize.height(24)),
            _buildButton("Login", _login),
            SizedBox(height: ResponsiveSize.height(12)),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignUpPage()),
                );
              },
              child: const Text(
                "Don't have an account? Sign Up",
                style: AppTextStyles.medium2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
