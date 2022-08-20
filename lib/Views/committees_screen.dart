import 'package:flutter/material.dart';

import '../Models/appBar.dart';
import '../Models/appDrawer.dart';
import '../colors.dart';
import '../widgets/speakers/speakerCard.dart';

class CommitteesScreen extends StatefulWidget {
  const CommitteesScreen({Key? key}) : super(key: key);

  @override
  State<CommitteesScreen> createState() => _CommitteesScreenState();
}

class _CommitteesScreenState extends State<CommitteesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBarWidget(title: "Committees"),
      drawer: appDrawer(),
      body: ListView(
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // MAIN TEXT CONTAINER
          ProfileDisplayWidget(
            name: "Prof John A Erkoyuncu",
            description:
            "Director Center for Digital Engineering and Manufacturing, Cranfield University, UK",
            imageUrl:
            "https://icodt2.com/wp-content/uploads/elementor/thumbs/702215-pgi4o7shbc4f677hdrz20yab2bhu30m7uxmvtgp0x4.jpeg",
          ),

          ProfileDisplayWidget(
            name: "Prof John A Erkoyuncu",
            description:
            "Director Center for Digital Engineering and Manufacturing, Cranfield University, UK",
            imageUrl:
            "https://icodt2.com/wp-content/uploads/elementor/thumbs/702215-pgi4o7shbc4f677hdrz20yab2bhu30m7uxmvtgp0x4.jpeg",
          ),
          ProfileDisplayWidget(
            name: "Prof John A Erkoyuncu",
            description:
            "Director Center for Digital Engineering and Manufacturing, Cranfield University, UK",
            imageUrl:
            "https://icodt2.com/wp-content/uploads/elementor/thumbs/702215-pgi4o7shbc4f677hdrz20yab2bhu30m7uxmvtgp0x4.jpeg",
          ),
        ],
      ),
    );
  }
}
