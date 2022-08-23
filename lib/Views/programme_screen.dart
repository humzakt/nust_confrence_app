import 'package:flutter/material.dart';
import 'package:nust_conference/Controller/firestoreMethods.dart';

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
  //Initial Dropdown Value
  String dropdownvalue = '15 Dec, 2022';

  // List of items in our dropdown menu
  var items = [
    '15 Dec, 2022',
    '16 Dec, 2022',
    '17 Dec, 2022',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      drawer: appDrawer(),
      // App Bar Widget Used

      appBar: AppBarWidget(title: "Programme Schedule"),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(10),
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: backgroundColor,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 1.0), //(x,y)
                    blurRadius: 5.0,
                  ),
                ],
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  // Initial Value
                  value: dropdownvalue,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),

                  // Down Arrow Icon
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.black,
                    size: 30,
                  ),

                  // Array list of items
                  items: items.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  // After selecting the desired option,it will
                  // change button value to selected value
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownvalue = newValue!;
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            GetSchedule(
              date: dropdownvalue,
            ),
          ],
        ),
      ),
      // ListView(
      //   children: [
      //     TimelineTileWidget(
      //       leading: "15 Dec, 2021",
      //       trailing: "Paper Starting",
      //       // isFirst: true,
      //     ),
      //     TimelineTileWidget(
      //       leading: "15 Dec, 2021",
      //       trailing: "Paper mid",
      //     ),
      //     TimelineTileWidget(
      //       leading: "15 Dec, 2021",
      //       trailing: "Paper mid",
      //     ),
      //     TimelineTileWidget(
      //       leading: "15 Dec, 2021",
      //       trailing: "Paper mid",
      //     ),
      //     TimelineTileWidget(
      //       leading: "15 Dec, 2021",
      //       trailing: "Submission Deadline",
      //     ),
      //     TimelineTileWidget(
      //       leading: "15 Dec, 2021",
      //       trailing: "Results",
      //       // isLast: true,
      //     ),
      //   ],
      // ),
    );
  }
}
