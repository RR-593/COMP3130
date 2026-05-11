import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trustmee_app/theme/app_theme.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 320,
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
              'Welcome!',
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
    );
  }
}
