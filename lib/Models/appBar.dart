import 'package:flutter/material.dart';
import '../colors.dart';

AppBar AppBarWidget() {
  return AppBar(
    centerTitle: true,
    title: const Text("Conference 2022"),
    backgroundColor: primaryColor,
    leading: Padding(
      padding: const EdgeInsets.all(5),
      child: Image.asset(
        "assets/nust.png",
        fit: BoxFit.cover,
      ),
    ),
  );
}
