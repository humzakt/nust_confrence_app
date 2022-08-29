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
      splash: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Text(
              "SECDIV - NIPS",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white, fontSize: 40, fontFamily: 'Calisto'),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Islamabad International Conference",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white, fontSize: 25, fontFamily: 'Calisto'),
            ),
            SizedBox(
              height: 10,
            ),
            // Text(
            //   "September 5 - 6 , 2020",
            //   textAlign: TextAlign.center,
            //   style: TextStyle(
            //       color: Colors.white, fontSize: 25, fontFamily: 'Calisto'),
            // ),
            SizedBox(
              height: 30,
            ),
            // Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  'assets/definingFutures.png',
                  width: MediaQuery.of(context).size.width / 5,
                  color: Colors.white,
                ),
                Image.asset(
                  'assets/MoFA.png',
                  width: MediaQuery.of(context).size.width / 5.5,
                  color: Colors.white,
                ),
                Image.asset(
                  'assets/nips.png',
                  width: MediaQuery.of(context).size.width / 5.5,
                  color: Colors.white,
                ),
              ],
            ),
          ],
        ),
      ),
      splashIconSize: 400,
      backgroundColor: primaryColor,
      nextScreen: Home(),
      // duration: 999999999999999999,
    );
  }
}
