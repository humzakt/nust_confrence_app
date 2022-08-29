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
    // leading: Builder(builder: (context) {
    //   return IconButton(
    //     onPressed: () {
    //       Scaffold.of(context).openDrawer();
    //     },
    //     icon: CircleAvatar(
    //       // radius: 20,
    //       backgroundImage: AssetImage(
    //         "assets/nust.png",
    //
    //         // fit: BoxFit.fitHeight,
    //         // width: 300,
    //       ),
    //     ),
    //   );
    // }),
  );
}
