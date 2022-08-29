import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nust_conference/Views/contact_screen.dart';
import 'package:nust_conference/Views/programme_screen.dart';
import 'package:nust_conference/Views/splashScreen.dart';
import 'package:nust_conference/provider/loggedInProvider.dart';
import 'package:provider/provider.dart';
import 'Views/home_screen.dart';
import 'Views/speaker_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => AdminProvider(),
          ),
        ],
        builder: (context, child) {
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
              '/contact': (context) => const ContactScreen(),
              '/programme': (context) => const ProgrammeScreen(),
            },
          );
        });
  }
}
