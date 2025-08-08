import 'package:flutter/material.dart';
import 'package:healthcare_assignment/core/constants/app_sizes.dart';
import 'package:healthcare_assignment/core/constants/app_text_styles.dart';
import 'package:healthcare_assignment/data/firebase/auth_service.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _authService = AuthService();

  bool _obscurePassword = true;

  // Cached sizes for smoother performance
  late double fieldFontSize;
  late double buttonFontSize;
  late double fieldPaddingV;
  late double fieldPaddingH;
  late double buttonRadius;
  late double buttonPaddingV;
  late double shadowBlur;
  late double shadowOffset;

  @override
  void initState() {
    super.initState();
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

  Future<void> _signup() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      _showMessage("Please fill all fields");
      return;
    }

    String? result = await _authService.signUp(email, password);

    if (result == null) {
      _showMessage("Sign up successful! Please login.", isError: false);
      Navigator.pop(context); // Go back to Login page
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
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: buttonPaddingV),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(buttonRadius),
          gradient: const LinearGradient(
            colors: [Colors.green, Colors.teal],
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
          child: Text(text,
              style: AppTextStyles.heading2.copyWith(color: Colors.white)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sign Up",
          style: AppTextStyles.heading2,
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(ResponsiveSize.width(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.person_add_alt_1,
                size: ResponsiveSize.width(80), color: Colors.green),
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
            _buildButton("Sign Up", _signup),
          ],
        ),
      ),
    );
  }
}
