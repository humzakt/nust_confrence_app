import 'package:flutter/material.dart';
import '../colors.dart';

AppBar AppBarWidget({required String title}) {
  return AppBar(
    centerTitle: true,
    title: Text(title),
    backgroundColor: primaryColor,
    leading: Builder(builder: (context) {
      return IconButton(
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
        icon: CircleAvatar(
          // radius: 20,
          backgroundImage: AssetImage(
            "assets/nust.png",

            // fit: BoxFit.fitHeight,
            // width: 300,
          ),
        ),
      );
    }),
  );
}
