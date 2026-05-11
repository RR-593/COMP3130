import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:trustmee_app/firebase_options.dart';
import 'package:trustmee_app/models/state.dart';
import 'package:trustmee_app/routes/app_routes.dart';
import 'package:trustmee_app/theme/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  await dotenv.load(fileName: '.secrets/maptiler_api');
  runApp(const TrustMeeApp());
}

class TrustMeeApp extends StatelessWidget {
  const TrustMeeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => StateModel(http.Client()),
      child: MaterialApp(
        title: 'TrustMee',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.darkBrand(),
        routes: AppRoutes.all(),
        home: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Scaffold(
                body: Center(child: CircularProgressIndicator()),
              );
            }
            if (snapshot.hasData) {
              return AppRoutes.all()[AppRoutes.map]!(context);
            }
            return AppRoutes.all()[AppRoutes.login]!(context);
          },
        ),
      ),
    );
  }
}
