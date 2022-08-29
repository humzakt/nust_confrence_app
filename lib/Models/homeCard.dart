import 'package:flutter/material.dart';
import '../colors.dart';

class HomeCard extends StatefulWidget {
  final IconData icon;
  final String text;
  final Function() ontap;

  HomeCard(
      {Key? key, required this.icon, required this.text, required this.ontap})
      : super(key: key);

  @override
  State<HomeCard> createState() => _HomeCardState();
}

class _HomeCardState extends State<HomeCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.ontap,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.18,
        width: MediaQuery.of(context).size.width * 0.35,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: backgroundColor,
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.5, 1.0), //(x,y)
              blurRadius: 5.0,
            ),
          ],
          border: Border.all(
            color: Colors.grey,
            width: 3,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              widget.icon,
              color: Colors.black,
              size: 80,
            ),
            Text(
              widget.text,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Calisto'),
            ),
          ],
        ),
      ),
    );
  }
}
