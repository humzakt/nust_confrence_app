import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:nust_conference/Views/home_screen.dart';
import 'package:nust_conference/colors.dart';

// Splash Screen
class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
              'assets/nust.png'), // displaying NUST icon on splash screen
        ],
      ),
      splashIconSize: 400,
      backgroundColor: primaryColor,
      nextScreen: Home(),
    );
  }
}
