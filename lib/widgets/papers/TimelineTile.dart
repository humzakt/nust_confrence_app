import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../colors.dart';

class TimelineTileWidget extends StatelessWidget {
  final String leading;
  final String trailing;
  final bool isFirst;
  final bool isLast;

  const TimelineTileWidget({
    Key? key,
    required this.leading,
    required this.trailing,
    this.isFirst = false,
    this.isLast = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TimelineTile(
      indicatorStyle: IndicatorStyle(
          color: secondaryColor, width: 20, padding: EdgeInsets.all(5)),
      beforeLineStyle: LineStyle(
        color: secondaryColor,
        thickness: 3,
      ),
      isLast: isLast,
      isFirst: isFirst,
      alignment: TimelineAlign.manual,
      lineXY: 0.38,
      endChild: Container(
        constraints: const BoxConstraints(
          minHeight: 120,
        ),
        // color: Colors.lightGreenAccent,
        child: TimelineChild(text: trailing),
      ),
      startChild: TimelineStartChild(text: leading),
    );
  }
}

class TimelineChild extends StatelessWidget {
  final String text;

  const TimelineChild({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: secondaryColor,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class TimelineStartChild extends StatelessWidget {
  final String text;

  const TimelineStartChild({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: secondaryColor,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
