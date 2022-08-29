import 'package:flutter/material.dart';
import 'package:nust_conference/Controller/getSpeakers.dart';
import 'package:nust_conference/colors.dart';

import '../Models/appBar.dart';
import '../Models/appDrawer.dart';
import '../widgets/speakers/speakerCard.dart';

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

      // ListView(
      //   // mainAxisAlignment: MainAxisAlignment.start,
      //   children: [
      //     // MAIN TEXT CONTAINER
      //     ProfileDisplayWidget(
      //       name: "Prof John A Erkoyuncu",
      //       description:
      //           "Director Center for Digital Engineering and Manufacturing, Cranfield University, UK",
      //       imageUrl:
      //           "https://icodt2.com/wp-content/uploads/elementor/thumbs/702215-pgi4o7shbc4f677hdrz20yab2bhu30m7uxmvtgp0x4.jpeg",
      //     ),
      //   ],
      // ),
    );
  }
}
