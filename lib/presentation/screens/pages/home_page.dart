import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:healthcare_assignment/core/constants/app_sizes.dart';
import 'package:healthcare_assignment/core/constants/app_text_styles.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int counter = 0;

  Widget _buildButton(
      String text, Color startColor, Color endColor, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          vertical: ResponsiveSize.height(14),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(ResponsiveSize.width(12)),
          gradient: LinearGradient(
            colors: [startColor, endColor],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: ResponsiveSize.width(6),
              offset: Offset(0, ResponsiveSize.height(3)),
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

  void _logout() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home Page",
          style: AppTextStyles.heading2,
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: "Logout",
            onPressed: _logout,
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(ResponsiveSize.width(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Counter: $counter", style: AppTextStyles.heading1),
            SizedBox(height: ResponsiveSize.height(30)),

            // Increment Button
            _buildButton(
              "Increment",
              Colors.blue,
              Colors.purple,
              () => setState(() => counter++),
            ),
            SizedBox(height: ResponsiveSize.height(16)),

            // Decrement Button
            _buildButton(
              "Decrement",
              Colors.red,
              Colors.orange,
              () => setState(() => counter--),
            ),
            SizedBox(height: ResponsiveSize.height(16)),

            // Reset Button
            _buildButton(
              "Reset",
              Colors.green,
              Colors.teal,
              () => setState(() => counter = 0),
            ),
          ],
        ),
      ),
    );
  }
}
