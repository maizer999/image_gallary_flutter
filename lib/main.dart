import 'package:flutter/material.dart';
import 'core/services/cache_helper.dart';
import 'core/routers/app_routers.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();

  final String token = await CacheHelper.getData('token') ?? '';
  final String startRoute =
  token.isNotEmpty ? Routers.galleryScreen : Routers.loginScreen;

  runApp(MyApp(startRoute: startRoute));
}

class MyApp extends StatelessWidget {
  final String startRoute;

  const MyApp({
    super.key,
    required this.startRoute,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: RoutersGenerated.onGenerateRoute,
      initialRoute: startRoute,
    );
  }
}
