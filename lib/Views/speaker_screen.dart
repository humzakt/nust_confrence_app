import 'package:flutter/material.dart';
import 'package:nust_conference/Controller/getSpeakers.dart';
import 'package:nust_conference/colors.dart';

import '../Models/appBar.dart';
import '../Models/appDrawer.dart';


class SpeakerScreen extends StatefulWidget {
  const SpeakerScreen({Key? key}) : super(key: key);

  @override
  State<SpeakerScreen> createState() => _SpeakerScreenState();
}

class _SpeakerScreenState extends State<SpeakerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      drawer: appDrawer(),
      // App Bar Widget Used

      appBar: AppBarWidget(title: "Speakers"),
      body: GetSpeakers(),
    );
  }
}
