import 'package:flutter/material.dart';
import '../colors.dart';

AppBar AppBarWidget({required String title, bool centertitle = true}) {
  return AppBar(
    centerTitle: centertitle,
    title: Text(
      title,
      style: TextStyle(fontFamily: 'Calisto'),
    ),
    backgroundColor: primaryColor,
  );
}
