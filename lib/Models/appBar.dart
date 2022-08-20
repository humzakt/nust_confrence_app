import 'package:flutter/material.dart';
import '../colors.dart';

AppBar AppBarWidget() {
  return AppBar(
    centerTitle: true,
    title: const Text("Conference 2022"),
    backgroundColor: primaryColor,
    leading: Builder(builder: (context) {
      return IconButton(
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
        icon: Image.asset(
          "assets/nust.png",
          // fit: BoxFit.fitHeight,
          // width: 300,
        ),
      );
    }),
  );
}
