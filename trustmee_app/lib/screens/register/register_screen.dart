import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trustmee_app/routes/app_routes.dart';
import 'package:trustmee_app/screens/login/widgets/login_email_field.dart';
import 'package:trustmee_app/screens/login/widgets/login_password_field.dart';
import 'package:trustmee_app/theme/app_theme.dart';

import 'widgets/register_button.dart';
import 'widgets/register_confirm_password_field.dart';
import 'widgets/register_sign_in_row.dart';

class RegisterScreen extends StatefulWidget {
  final FirebaseAuth auth;
  RegisterScreen({super.key, FirebaseAuth? auth})
      : auth = auth ?? FirebaseAuth.instance;

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _isLoading = false;
  String? _errorMessage;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _handleRegister() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text;
    final confirmPassword = _confirmPasswordController.text;

    if (email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      setState(() => _errorMessage = 'Please fill in all fields.');
      return;
    }

    if (password != confirmPassword) {
      setState(() => _errorMessage = 'Passwords do not match.');
      return;
    }

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      await widget.auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (mounted) {
        Navigator.pushReplacementNamed(context, AppRoutes.map);
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        if (e.code == 'weak-password') {
          _errorMessage = 'Password is too weak.';
        } else if (e.code == 'email-already-in-use') {
          _errorMessage = 'An account already exists for that email.';
        } else if (e.code == 'invalid-email') {
          _errorMessage = 'Invalid email address.';
        } else {
          _errorMessage = 'Registration failed. Please try again.';
        }
      });
    } catch (_) {
      setState(() => _errorMessage = 'An unexpected error occurred.');
    } finally {
      if (mounted) setState(() => _isLoading = false);
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
              SizedBox(
                height: 260,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 20),
                      Text(
                        'TrustMee,',
                        style: GoogleFonts.inriaSerif(
                          color: AppTheme.textPrimary,
                          fontSize: 64,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Join us!',
                        style: GoogleFonts.inriaSerif(
                          color: AppTheme.textPrimary,
                          fontSize: 64,
                          fontWeight: FontWeight.w300,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
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
                        RegisterConfirmPasswordField(
                          controller: _confirmPasswordController,
                          obscurePassword: _obscureConfirmPassword,
                          onToggleVisibility: () => setState(() =>
                              _obscureConfirmPassword =
                                  !_obscureConfirmPassword),
                        ),
                        if (_errorMessage != null) ...[
                          const SizedBox(height: 12),
                          Text(
                            _errorMessage!,
                            style: const TextStyle(
                              color: Color(0xFFFF6B6B),
                              fontSize: 13,
                            ),
                          ),
                        ],
                        const SizedBox(height: 20),
                        _isLoading
                            ? const SizedBox(
                                width: double.infinity,
                                height: 54,
                                child: Center(
                                  child: CircularProgressIndicator(
                                    color: AppTheme.accent,
                                  ),
                                ),
                              )
                            : RegisterButton(onPressed: _handleRegister),
                        const SizedBox(height: 20),
                        RegisterSignInRow(
                          onSignInPressed: () =>
                              Navigator.pushReplacementNamed(
                                  context, AppRoutes.login),
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
