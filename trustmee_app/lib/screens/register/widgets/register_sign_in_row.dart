import 'package:flutter/material.dart';
import 'package:trustmee_app/theme/app_theme.dart';

class RegisterSignInRow extends StatelessWidget {
  const RegisterSignInRow({super.key, required this.onSignInPressed});

  final VoidCallback onSignInPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Already have an account?',
          style: TextStyle(color: AppTheme.textSecondary),
        ),
        TextButton(
          onPressed: onSignInPressed,
          style: TextButton.styleFrom(
            foregroundColor: AppTheme.accent,
            padding: const EdgeInsets.symmetric(horizontal: 6),
            minimumSize: const Size(0, 0),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: const Text(
            'Sign In',
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
