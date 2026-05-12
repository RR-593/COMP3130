import 'package:flutter/material.dart';
import 'package:trustmee_app/theme/app_theme.dart';
import 'package:trustmee_app/widgets/inner_shadow.dart';

class LoginEmailField extends StatelessWidget {
  const LoginEmailField({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(14),
      child: InnerShadow(
        blur: 6,
        color: Colors.black.withValues(alpha: 0.25),
        offset: const Offset(0, 4),
        child: TextField(
          controller: controller,
          keyboardType: TextInputType.emailAddress,
          enableSuggestions: false,
          style: const TextStyle(color: AppTheme.textPrimary),
          decoration: InputDecoration(
            hintText: 'Email address',
            hintStyle: const TextStyle(color: AppTheme.textSecondary),
            prefixIcon: const Icon(Icons.mail_outline, color: AppTheme.accent),
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
        ),
      ),
    );
  }
}
