import 'package:flutter/material.dart';
import 'package:nust_conference/colors.dart';

class ProfileDisplayWidget extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String description;

  const ProfileDisplayWidget(
      {Key? key,
      this.imageUrl = '',
      required this.name,
      required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(imageUrl);
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
          CircleAvatar(
            radius: 50,
            backgroundColor: Colors.grey[200],
            backgroundImage: imageUrl == ''
                ? Image.asset('assets/default.png').image
                : NetworkImage(
                    imageUrl,
                  ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            name,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.black,
                fontFamily: 'Calisto'),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            description,
            style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
                fontFamily: 'Calisto',
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
