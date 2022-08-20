import 'package:flutter/material.dart';
import 'package:nust_conference/Views/splashScreen.dart';

import 'Views/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      home: const SplashScreen(),
      routes: {
        '/splashScreen': (context) => const SplashScreen(),
        '/home': (context) => const Home(),
      },
    );
  }
}
