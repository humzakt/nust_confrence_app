import 'package:flutter/material.dart';
import 'package:nust_conference/Controller/checkInternet.dart';
import 'package:nust_conference/Controller/navigate.dart';
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

      appBar: AppBarWidget(title: "Welcome to Conference"),
      body: ListView(
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 5,
              vertical: 20,
            ),
            child: Column(
              children: [
                // MAIN TEXT CONTAINER
                Container(
                  // padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.symmetric(vertical: 20),

                  // height: 40,
                  // // // decoration: BoxDecoration(
                  // //   borderRadius: BorderRadius.circular(25),
                  // //   color: backgroundColor,
                  // //   boxShadow: const [
                  // //     BoxShadow(
                  // //       color: Colors.grey,
                  // //       offset: Offset(0.0, 1.0), //(x,y)
                  // //       blurRadius: 5.0,
                  // //     ),
                  // //   ],
                  // ),
                  child: Image.asset(
                    'assets/conferenceText.png',
                    color: Colors.white,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
                // CHILD TEXT
                const Text(
                  "2nd International Conference on Digital Futures and Transformative Technologies will provide and exceelt international forum for sharing knowledge and results in theory , methodology and results.",
                  style: TextStyle(
                      color: Colors.grey, fontSize: 15, fontFamily: 'Calisto'),
                  textAlign: TextAlign.center,
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
                icon: Icons.query_builder,
                text: "AGENDA",
                ontap: () async {
                  await checkInternet(context)
                      ? Navigator.pushNamed(context, '/programme')
                      : showDialog(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: Text("No Internet"),
                            content:
                                Text("Please check your internet connection"),
                            actions: [
                              TextButton(
                                child: Text("OK"),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              )
                            ],
                          ),
                        );
                },
              ),
              HomeCard(
                icon: Icons.people,
                text: "SPEAKERS",
                ontap: () {
                  Navigator.pushNamed(context, '/speakers');
                },
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              HomeCard(
                  icon: Icons.map_outlined,
                  text: "VENUE",
                  ontap: () {
                    navigateTo();
                  }),
              HomeCard(
                  icon: Icons.contact_support_outlined,
                  text: "CONTACT",
                  ontap: () {}),
            ],
          ),

          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                'assets/definingFutures.png',
                width: MediaQuery.of(context).size.width / 5,
                color: Colors.white,
              ),
              Image.asset(
                'assets/MoFA.png',
                width: MediaQuery.of(context).size.width / 5.5,
                color: Colors.white,
              ),
              Image.asset(
                'assets/nips.png',
                width: MediaQuery.of(context).size.width / 5.5,
                color: Colors.white,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
