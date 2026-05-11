import 'package:flutter/material.dart';
import 'package:trustmee_app/theme/app_theme.dart';

class LoginPasswordField extends StatelessWidget {
  const LoginPasswordField({
    super.key,
    required this.controller,
    required this.obscurePassword,
    required this.onToggleVisibility,
  });

  final TextEditingController controller;
  final bool obscurePassword;
  final VoidCallback onToggleVisibility;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscurePassword,
      style: const TextStyle(color: AppTheme.textPrimary),
      decoration: InputDecoration(
        hintText: 'Password',
        hintStyle: const TextStyle(color: AppTheme.textSecondary),
        prefixIcon: const Icon(Icons.lock_outline, color: AppTheme.accent),
        suffixIcon: IconButton(
          icon: Icon(
            obscurePassword ? Icons.visibility_off : Icons.visibility,
            color: AppTheme.textSecondary,
          ),
          onPressed: onToggleVisibility,
        ),
        filled: true,
        fillColor: AppTheme.surfaceAlt,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: AppTheme.accent, width: 1.5),
        ),
      ),
    );
  }
}
