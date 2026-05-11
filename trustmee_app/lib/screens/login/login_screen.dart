import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:trustmee_app/routes/app_routes.dart';
import 'package:trustmee_app/theme/app_theme.dart';

import 'widgets/login_email_field.dart';
import 'widgets/login_header.dart';
import 'widgets/login_password_field.dart';
import 'widgets/login_sign_in_button.dart';
import 'widgets/login_sign_up_row.dart';
import 'widgets/login_social_buttons.dart';

class LoginScreen extends StatefulWidget {
  final FirebaseAuth auth;
  LoginScreen({super.key, FirebaseAuth? auth})
      : auth = auth ?? FirebaseAuth.instance;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;
  final bool _isLoginView = true;
  bool _loginSucceess = false;
  String? _errorMessage;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleLogin() async {
    // Simple login handling
    final email = _emailController.text;
    final password = _passwordController.text;

    print('Login attempt with: $email');
    try {
      await widget.auth
          .signInWithEmailAndPassword(email: email, password: password);
      _loginSucceess = true;
      setState(() => _errorMessage = null);
    } on FirebaseAuthException catch (e) {
      setState(() {
        if (e.code == 'user-not-found') {
          _errorMessage = 'No account found for that email.';
        } else if (e.code == 'wrong-password') {
          _errorMessage = 'Incorrect password.';
        } else {
          _errorMessage = e.message ?? 'Login failed.';
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/Login-Backgound.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          bottom: false,
          child: Column(
            children: [
              const LoginHeader(),
              Expanded(
                //
                //Login Modal Box
                //
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(12, 16, 67, 0.33),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(28),
                      topRight: Radius.circular(28),
                    ),
                  ),
                  padding: const EdgeInsets.fromLTRB(17, 20, 17, 20),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        LoginEmailField(controller: _emailController),
                        const SizedBox(height: 20),
                        LoginPasswordField(
                          controller: _passwordController,
                          obscurePassword: _obscurePassword,
                          onToggleVisibility: () => setState(
                              () => _obscurePassword = !_obscurePassword),
                        ),
                        const SizedBox(height: 20),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              foregroundColor: AppTheme.accent,
                              padding: EdgeInsets.zero,
                              minimumSize: const Size(0, 0),
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            child: const Text(
                              'Forgot Password?',
                              style: TextStyle(
                                color: AppTheme.accent,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        if (_errorMessage != null)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: Text(
                              _errorMessage!,
                              style: const TextStyle(color: Colors.redAccent, fontSize: 13),
                            ),
                          ),
                        LoginSignInButton(onPressed: _handleLogin),
                        const SizedBox(height: 20),
                        const Row(
                          children: [
                            Expanded(
                              child: Divider(
                                  color: AppTheme.surfaceAlt, thickness: 1),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 12),
                              child: Text(
                                'or continue with',
                                style: TextStyle(
                                  color: AppTheme.textSecondary,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Divider(
                                  color: AppTheme.surfaceAlt, thickness: 1),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        LoginSocialButtons(
                          onGooglePressed: () {},
                          onApplePressed: () {},
                        ),
                        const SizedBox(height: 20),
                        LoginSignUpRow(
                          onSignUpPressed: () =>
                              Navigator.pushNamed(context, AppRoutes.register),
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
