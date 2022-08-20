import 'package:flutter/material.dart';
import 'package:nust_conference/Models/appBar.dart';
import 'package:nust_conference/Models/appDrawer.dart';
import 'package:nust_conference/Models/homeCard.dart';
import 'package:nust_conference/colors.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

// Screen After Splash Screen
class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      drawer: appDrawer(),
      // App Bar Widget Used

      appBar: AppBarWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 20.0,
              left: 35,
              right: 35,
            ),
            child: Column(
              children: [
                // MAIN TEXT CONTAINER
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
                  child: const Text(
                    "Welcome to Conference 2022",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
                // CHILD TEXT
                const Text(
                  "2nd International Conference on Digital Futures and Transformative Technologies will provide and exceelt international forum for sharing knowledge and results in theory , methodology and results.",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),

          // HOME CARDS
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              HomeCard(
                icon: Icons.file_copy_outlined,
                text: "PAPERS",
                ontap: () {},
              ),
              HomeCard(icon: Icons.people, text: "SPEAKERS", ontap: () {}),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              HomeCard(icon: Icons.groups, text: "COMMITTEES", ontap: () {}),
              HomeCard(
                  icon: Icons.query_builder, text: "PROGRAMME", ontap: () {}),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              HomeCard(icon: Icons.map_outlined, text: "VENUE", ontap: () {}),
              HomeCard(
                  icon: Icons.contact_support_outlined,
                  text: "CONTACT",
                  ontap: () {}),
            ],
          ),
        ],
      ),
    );
  }
}
