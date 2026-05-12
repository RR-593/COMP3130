import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:trustmee_app/routes/app_routes.dart';
import 'package:trustmee_app/theme/app_theme.dart';
import 'package:trustmee_app/widgets/glass_container.dart';

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
  String? _errorMessage;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleLogin() async {
    final email = _emailController.text;
    final password = _passwordController.text;

    print('Login attempt with: $email');
    try {
      await widget.auth
          .signInWithEmailAndPassword(email: email, password: password);
      setState(() => _errorMessage = null);
    } on FirebaseAuthException catch (e) {
      setState(() => _errorMessage = _authErrorMessage(e.code));
    }
  }

  static String _authErrorMessage(String code) => switch (code) {
        'invalid-email' => 'Invalid email address.',
        'user-not-found' ||
        'invalid-credential' =>
          'Email or password is incorrect.',
        'wrong-password' => 'Email or password is incorrect.',
        'user-disabled' => 'This account has been disabled.',
        'too-many-requests' => 'Too many attempts. Try again later.',
        'network-request-failed' => 'Network error. Check your connection.',
        'operation-not-allowed' => 'Sign-in method not allowed.',
        'requires-recent-login' => 'Please sign in again to continue.',
        _ => 'Login failed. Please try again.',
      };

  static const double gap = 20;

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Login-Backgound.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Column(
              children: [
                const Expanded(child: SizedBox()),
                const LoginHeader(),
                // Glass modal
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: GlassContainer(
                    borderRadius: const BorderRadius.all(Radius.circular(22)),
                    padding: const EdgeInsets.fromLTRB(17, 20, 17, 20),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          LoginEmailField(controller: _emailController),
                          const SizedBox(height: 12),
                          LoginPasswordField(
                            controller: _passwordController,
                            obscurePassword: _obscurePassword,
                            onToggleVisibility: () => setState(
                                () => _obscurePassword = !_obscurePassword),
                          ),
                          const SizedBox(height: 4),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              if (_errorMessage != null)
                                Expanded(
                                  child: Text(
                                    _errorMessage!,
                                    style: const TextStyle(
                                        color: Colors.redAccent, fontSize: 13),
                                  ),
                                )
                              else
                                const Expanded(child: SizedBox()),
                              TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                  foregroundColor: AppTheme.accent,
                                  padding: EdgeInsets.zero,
                                  minimumSize: const Size(0, 0),
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                ),
                                child: const Text(
                                  'Forgot Password?',
                                  style: TextStyle(
                                    color: AppTheme.accent,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: gap),
                          LoginSignInButton(onPressed: _handleLogin),
                          const SizedBox(height: gap),
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
                          const SizedBox(height: gap),
                          LoginSocialButtons(
                            onGooglePressed: () {},
                            onApplePressed: () {},
                          ),
                          const SizedBox(height: gap),
                          LoginSignUpRow(
                            onSignUpPressed: () => Navigator.pushNamed(
                                context, AppRoutes.register),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const Expanded(child: SizedBox()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
