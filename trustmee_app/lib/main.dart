import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:trustmee_app/routes/app_routes.dart';
import 'package:trustmee_app/theme/app_theme.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  await dotenv.load(fileName: '.secrets/maptiler_api');
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
      initialRoute: AppRoutes.map,
      routes: AppRoutes.all(),
    );
  }
}
