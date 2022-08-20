import 'package:flutter/material.dart';

import '../Models/appBar.dart';
import '../Models/appDrawer.dart';
import '../colors.dart';
import '../widgets/papers/TimelineTile.dart';

class ProgrammeScreen extends StatefulWidget {
  const ProgrammeScreen({Key? key}) : super(key: key);

  @override
  State<ProgrammeScreen> createState() => _ProgrammeScreenState();
}

class _ProgrammeScreenState extends State<ProgrammeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      drawer: appDrawer(),
      // App Bar Widget Used

      appBar: AppBarWidget(title: "Programme Schedule"),
      body: ListView(
        children: [
          TimelineTileWidget(
            leading: "15 Dec, 2021",
            trailing: "Paper Starting",
            isFirst: true,
          ),
          TimelineTileWidget(
            leading: "15 Dec, 2021",
            trailing: "Paper mid",
          ),
          TimelineTileWidget(
            leading: "15 Dec, 2021",
            trailing: "Paper mid",
          ),
          TimelineTileWidget(
            leading: "15 Dec, 2021",
            trailing: "Paper mid",
          ),
          TimelineTileWidget(
            leading: "15 Dec, 2021",
            trailing: "Submission Deadline",
          ),
          TimelineTileWidget(
            leading: "15 Dec, 2021",
            trailing: "Results",
            isLast: true,
          ),
        ],
      ),
    );
  }
}
