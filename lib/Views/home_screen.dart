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

      appBar: AppBarWidget(title: "Home", centertitle: false),

      body: ListView(
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 0,
              vertical: 0,
            ),
            child: Column(
              children: [
                // MAIN TEXT CONTAINER
                Container(
                  // padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.symmetric(vertical: 0),
                  child: Image.asset('assets/backdropImg.jpeg'),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.3,
                ),
              ],
            ),
          ),
          // const SizedBox(
          //   height: 0,
          // ),

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
                ontap: () async {
                  await checkInternet(context)
                      ? Navigator.pushNamed(context, '/speakers')
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
                  ontap: () {
                    Navigator.pushNamed(context, '/contact');
                  }),
            ],
          ),

          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
