import 'package:flutter/material.dart';
import 'package:trustmee_app/routes/app_routes.dart';
import 'package:trustmee_app/theme/app_theme.dart';

void main() {
  runApp(const TrustMeeApp());
}

class TrustMeeApp extends StatelessWidget {
  const TrustMeeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TrustMee',
      debugShowCheckedModeBanner: false,
      // Login flow uses dark brand theme; settings flow uses iOS-light theme
      // per-screen via Theme widgets if needed. Default = dark brand.
      theme: AppTheme.darkBrand(),
      initialRoute: AppRoutes.login,
      routes: AppRoutes.all(),
    );
  }
}
