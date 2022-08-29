import 'dart:io';
import 'package:flutter/material.dart';

Future<bool> checkInternet(BuildContext context) async {
  try {
    print("in check internet method");
    final result = await InternetAddress.lookup('example.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      print("connected to internet");
      return true;
    } else {
      Navigator.pushNamed(context, '/error')
          .then((value) => checkInternet(context));
    }
    print("outside if else");

    return false;
  } on SocketException catch (_) {
    print('not connected to the Internet');

    return false;
  }
}
