import 'package:flutter/material.dart';
import 'package:trustmee_app/theme/app_theme.dart';

class LoginSocialButtons extends StatelessWidget {
  const LoginSocialButtons({
    super.key,
    required this.onGooglePressed,
    required this.onApplePressed,
  });

  final VoidCallback onGooglePressed;
  final VoidCallback onApplePressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton.icon(
            onPressed: onGooglePressed,
            icon: const Icon(Icons.g_mobiledata,
                color: AppTheme.textPrimary, size: 28),
            label: const Text(
              'Google',
              style: TextStyle(color: AppTheme.textPrimary),
            ),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 14),
              side: const BorderSide(color: AppTheme.surfaceAlt),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: OutlinedButton.icon(
            onPressed: onApplePressed,
            icon: const Icon(Icons.apple, color: AppTheme.textPrimary),
            label: const Text(
              'Apple',
              style: TextStyle(color: AppTheme.textPrimary),
            ),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 14),
              side: const BorderSide(color: AppTheme.surfaceAlt),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
