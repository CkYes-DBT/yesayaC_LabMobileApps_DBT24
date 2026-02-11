import 'package:flutter/material.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custom_button.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLogin() {
    setState(() {
      _isLoading = true;
    });

    // Simulasi login
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
      });
      // Navigate to home page
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF000000),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 60),
                
                // Instagram Logo
                Image.asset(
                  'assets/images/download.jpeg',
                  height: 60,
                  fit: BoxFit.contain,
                ),
                
                const SizedBox(height: 60),
                
                // Username TextField (reusable component)
                CustomTextField(
                  controller: _usernameController,
                  hintText: 'Username, email or mobile number',
                  prefixIcon: Icons.person_outline,
                ),
                
                const SizedBox(height: 12),
                
                // Password TextField (reusable component)
                CustomTextField(
                  controller: _passwordController,
                  hintText: 'Password',
                  isPassword: true,
                  prefixIcon: Icons.lock_outline,
                ),
                
                const SizedBox(height: 16),
                
                // Login Button (reusable component)
                CustomButton(
                  text: 'Log in',
                  onPressed: _handleLogin,
                  isLoading: _isLoading,
                ),
                
                const SizedBox(height: 24),
                
                // Forgot password
                GestureDetector(
                  onTap: () {
                    // 
                  },
                  child: Text(
                    'Forgot password?',
                    style: TextStyle(
                      color: const Color(0xFF0095F6),
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                
                const SizedBox(height: 40),
                
                // Divider with OR
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: Colors.grey[800],
                        thickness: 1,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'OR',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.grey[800],
                        thickness: 1,
                      ),
                    ),
                  ],
                ),
                
                const SizedBox(height: 40),
                
                // Login with Facebook
                GestureDetector(
                  onTap: () {
                    // 
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.facebook,
                        color: const Color(0xFF0095F6),
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'Log in with Facebook',
                        style: TextStyle(
                          color: Color(0xFF0095F6),
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: 60),
              ],
            ),
          ),
        ),
      ),
      
      // Bottom Sign Up
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.grey[900]!,
              width: 1,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Don't have an account? ",
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 12,
              ),
            ),
            GestureDetector(
              onTap: () {
                
              },
              child: const Text(
                'Sign up',
                style: TextStyle(
                  color: Color(0xFF0095F6),
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
