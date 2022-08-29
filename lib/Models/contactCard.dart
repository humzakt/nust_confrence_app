import 'package:flutter/material.dart';
import 'package:nust_conference/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactCard extends StatelessWidget {
  final String name;
  final String description;
  final String phone;
  final String mob;
  const ContactCard(
      {Key? key,
      required this.name,
      required this.description,
      required this.phone,
      this.mob = ''})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: secondaryColor,
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.0), //(x,y)
            blurRadius: 5.0,
          ),
        ],
      ),
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          Text(
            name,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.black,
                fontFamily: 'Calisto'),
          ),
          // SizedBox(
          //   height: 5,
          // ),
          Text(
            description,
            style: TextStyle(
              color: Colors.black87,
              fontSize: 15,
              fontFamily: 'Calisto',
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text(
                "Phone # ",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontFamily: 'Calisto',
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: () async {
                  final str = "tel:$phone";
                  var url = Uri.parse(str);
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url);
                  } else {
                    SnackBar(
                      content: Text("Could not call: $str"),
                    );
                  }
                },
                child: Text(phone,
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 15,
                        fontFamily: 'Calisto')),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Mobile # ",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontFamily: 'Calisto',
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: () async {
                  final str = "tel:$mob";
                  var url = Uri.parse(str);
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url);
                  } else {
                    SnackBar(
                      content: Text("Could not call: $str"),
                    );
                  }
                },
                child: Text(mob,
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 15,
                        fontFamily: 'Calisto')),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
