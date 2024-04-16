import 'package:app_peliculas/core/router/router.dart';
import 'package:app_peliculas/core/services/dependencies_injection_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:url_strategy/url_strategy.dart';

final tmbdUrl = dotenv.env['TMBD_URL']!;
final apiKey = dotenv.env['API_KEY']!;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await init();
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Pelicualas App',
      routerConfig: goRouter,
    );
  }
}
