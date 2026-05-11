import 'package:flutter/material.dart';
import 'package:trustmee_app/theme/app_theme.dart';

class LoginSignUpRow extends StatelessWidget {
  const LoginSignUpRow({super.key, required this.onSignUpPressed});

  final VoidCallback onSignUpPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Don't have an account?",
          style: TextStyle(color: AppTheme.textSecondary),
        ),
        TextButton(
          onPressed: onSignUpPressed,
          style: TextButton.styleFrom(
            foregroundColor: AppTheme.accent,
            padding: const EdgeInsets.symmetric(horizontal: 6),
            minimumSize: const Size(0, 0),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: const Text(
            'Sign Up',
            style: TextStyle(
              color: AppTheme.accent,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
