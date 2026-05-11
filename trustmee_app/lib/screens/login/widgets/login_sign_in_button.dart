import 'package:flutter/material.dart';
import 'package:trustmee_app/theme/app_theme.dart';

class LoginSignInButton extends StatelessWidget {
  const LoginSignInButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(14),
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(14),
          child: Ink(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              gradient: const LinearGradient(
                colors: [AppTheme.accent, Color(0xFF00A57D)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
            child: const Center(
              child: Text(
                'Sign In',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
