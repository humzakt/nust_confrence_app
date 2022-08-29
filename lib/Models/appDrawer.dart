import 'package:flutter/material.dart';
import 'package:nust_conference/Controller/authMethods.dart';
import 'package:nust_conference/Controller/navigate.dart';
import 'package:nust_conference/Models/loginDialog.dart';
import 'package:nust_conference/colors.dart';
import 'package:nust_conference/provider/loggedInProvider.dart';
import 'package:provider/provider.dart';

import '../Controller/checkInternet.dart';

class appDrawer extends StatelessWidget {
  const appDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        backgroundColor: primaryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          // Important: Remove any padding from the ListView.
          // padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                  // color: primaryColor,
                  ),
              child: Image.asset(
                "assets/nips.png",
                color: secondaryColor,
                // fit: BoxFit.fitHeight,
                height: MediaQuery.of(context).size.width * 0.3,
              ),
            ),

            // const Text(
            //   "SECDIV - NIPS",
            //   style: TextStyle(
            //       fontWeight: FontWeight.w400,
            //       fontSize: 30,
            //       color: secondaryColor,
            //       fontFamily: 'Calisto'),
            //   textAlign: TextAlign.center,
            // ),
            const SizedBox(
              height: 10,
            ),
            Divider(
              color: secondaryColor,
            ),
            const SizedBox(
              height: 10,
            ),
            appDrawerListTile(
              title: 'Home',
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/home', (route) => false);
              },
              icon: Icons.home_filled,
            ),
            appDrawerListTile(
              title: 'Contact Us',
              onTap: () {},
              icon: Icons.call,
            ),
            appDrawerListTile(
              title: 'Locate Venue',
              onTap: () {
                navigateTo();
              },
              icon: Icons.directions,
            ),
            // Spacer()
            Expanded(child: SizedBox()),

            Provider.of<AdminProvider>(context, listen: true).isLoggedIn
                ? logoutButton()
                : loginButton(),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  'assets/nust.png',
                  width: MediaQuery.of(context).size.width / 5,
                  // color: Colors.white,
                ),
                Image.asset(
                  'assets/MoFA.png',
                  width: MediaQuery.of(context).size.width / 6.5,
                  color: Colors.white,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.copyright,
                  color: Colors.white,
                ),
                Text(
                  " Developed by NUST LMS Team",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w300),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}

class logoutButton extends StatelessWidget {
  const logoutButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async {
        if (await checkInternet(context)) {
          AuthMethods().signOut(context);
          Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
        } else
          showDialog(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: Text("No Internet"),
              content: Text("Please check your internet connection"),
              actions: [
                TextButton(
                  child: Text("OK"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
            ),
          );

        // showDialog(
        //   context: context,
        //   builder: (_) => DialogWidget(),
        //   barrierDismissible: false,
        // );
      },
      child: Container(
        // color: secondaryColor,
        decoration: BoxDecoration(
          border: Border.all(
            color: secondaryColor,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.center,
        height: 50,
        width: 150,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Icon(
              Icons.logout,
              color: secondaryColor,
            ),
            // alignment: Alignment.bottomLeft,

            SizedBox(
              width: 10,
            ),
            Text(
              'Logout',
              style: TextStyle(
                  color: secondaryColor, fontSize: 20, fontFamily: 'Calisto'),
            ),
          ],
        ),
      ),
    );
  }
}

class loginButton extends StatelessWidget {
  const loginButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async {
        await checkInternet(context)
            ? showDialog(
                context: context,
                builder: (_) => DialogWidget(),
                barrierDismissible: false,
              )
            : showDialog(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: Text("No Internet"),
                  content: Text("Please check your internet connection"),
                  actions: [
                    TextButton(
                      child: Text("OK"),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    )
                  ],
                ),
              );
        // showDialog(
        //   context: context,
        //   builder: (_) => DialogWidget(),
        //   barrierDismissible: false,
        // );
      },
      child: Container(
        // color: secondaryColor,
        decoration: BoxDecoration(
          border: Border.all(
            color: secondaryColor,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.center,
        height: 50,
        width: 150,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Icon(
              Icons.login,
              color: secondaryColor,
            ),
            // alignment: Alignment.bottomLeft,

            SizedBox(
              width: 10,
            ),
            Text(
              'Login',
              style: TextStyle(
                  color: secondaryColor, fontSize: 20, fontFamily: 'Calisto'),
            ),
          ],
        ),
      ),
    );
  }
}

class appDrawerListTile extends StatelessWidget {
  IconData icon;

  final GestureTapCallback? onTap;

  String title;

  appDrawerListTile({
    Key? key,
    required this.title,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: ListTile(
        // leading:
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: secondaryColor,
            ),
            // Expanded(child: SizedBox()),
            const SizedBox(
              width: 20,
            ),

            Text(
              title,
              style: const TextStyle(
                  color: secondaryColor, fontSize: 20, fontFamily: 'Calisto'),
            ),
          ],
        ),
        onTap: onTap,
      ),
    );
  }
}
