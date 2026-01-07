import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/routers/app_routers.dart';
import 'core/services/cache_helper.dart';


late final ProviderContainer providerContainer;


Future<void> main() async {
  providerContainer = ProviderContainer();

  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: RoutersGenerated.onGenerateRoute,
      initialRoute: Routers.loginScreen,
    );
  }
}
