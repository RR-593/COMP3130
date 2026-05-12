import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trustmee_app/theme/app_theme.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'TrustMee,',
            style: GoogleFonts.inriaSerif(
              color: const Color.fromARGB(255, 255, 255, 255),
              fontSize: 64,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
          ),
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
    );
  }
}
