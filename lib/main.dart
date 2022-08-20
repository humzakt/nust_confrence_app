import 'package:flutter/material.dart';
import 'package:nust_conference/Views/papers_screen.dart';
import 'package:nust_conference/Views/programme_screen.dart';
import 'package:nust_conference/Views/splashScreen.dart';

import 'Views/committees_screen.dart';
import 'Views/home_screen.dart';
import 'Views/speaker_screen.dart';

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
        '/speakers': (context) => const SpeakerScreen(),
        '/home': (context) => const Home(),
        '/papers': (context) => const PaperScreen(),
        '/committee': (context) => const CommitteesScreen(),
        '/programme': (context) => const ProgrammeScreen(),
      },
    );
  }
}
