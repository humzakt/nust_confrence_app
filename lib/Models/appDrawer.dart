import 'package:flutter/material.dart';
import 'package:nust_conference/colors.dart';

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
                "assets/nust.png",
                // color: secondaryColor,
                // fit: BoxFit.fitHeight,
              ),
            ),
            const Text(
              "Nust Conference",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 30,
                color: secondaryColor,
              ),
              textAlign: TextAlign.center,
            ),
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
              onTap: () {},
              icon: Icons.directions,
            ),
            // Spacer()
            Expanded(child: SizedBox()),
            loginButton(),
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
      onPressed: () {},
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
              style: TextStyle(color: secondaryColor, fontSize: 20),
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
            SizedBox(
              width: 20,
            ),

            Text(
              title,
              style: TextStyle(color: secondaryColor, fontSize: 20),
            ),
          ],
        ),
        onTap: onTap,
      ),
    );
  }
}
