import 'package:flutter/material.dart';
import 'package:nust_conference/Models/appBar.dart';
import 'package:nust_conference/Models/contactCard.dart';
import 'package:nust_conference/colors.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: "Contact"),
      backgroundColor: primaryColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              ContactCard(
                  name: 'Aown Arshad Gillani',
                  description:
                      'Director (Licensing),Strategic Export Control Division, Ministry of Foreign Affairs, Islamabad',
                  phone: '+92 51 9216735',
                  mob: '+92 332 8336030'),
              ContactCard(
                  name: 'Hafiz Wasif Mehmood',
                  description:
                      'Deputy Director (Policy), Strategic Export Control Division, Ministry of Foreign Affairs, Islamabad',
                  phone: '+92 51 9216734',
                  mob: '+92 333 7077575'),
              ContactCard(
                  name: 'Muhammad Usman',
                  description:
                      'Assistant Director Administration & Coordination, NUST Institute of Policy Studies (NIPS), Islamabad Pakistan',
                  phone: '+92 51 90821483',
                  mob: '+92-3175476622'),
            ],
          ),
        ),
      ),
    );
  }
}
