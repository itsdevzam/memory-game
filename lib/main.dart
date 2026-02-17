import 'package:flutter/material.dart';
import 'package:memory_card/provider/HomeProvider.dart';
import 'package:memory_card/provider/SplashProvider.dart';
import 'package:memory_card/screen/HomeScreen.dart';
import 'package:memory_card/screen/SplashScreen.dart';
import 'package:memory_card/utils/Constants.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SplashProvider()),
        ChangeNotifierProvider(create: (_) => HomeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: Map.of({
        '/': (context) => const SplashScreen(),
        'home': (context) => const HomeScreen(),
      }),
      title: Constants.appName,
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
    );
  }
}
