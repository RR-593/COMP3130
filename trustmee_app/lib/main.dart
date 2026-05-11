import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:trustmee_app/models/state.dart';
import 'package:trustmee_app/routes/app_routes.dart';
import 'package:trustmee_app/theme/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
        initialRoute: AppRoutes.map,
        routes: AppRoutes.all(),
      ),
    );
  }
}
