import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import '../../colors.dart';

class TimelineTileWidget extends StatelessWidget {
  final String leading;
  final String trailing;

  const TimelineTileWidget({
    Key? key,
    required this.leading,
    required this.trailing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var data = trailing.split('\\n');
    // print(data);
    var updatedData = List.from(data);
    if (data.length > 1) {
      updatedData.removeRange(0, 1);
      updatedData[0] = "\n● " + updatedData[0];
    }

    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: backgroundColor,
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.0), //(x,y)
            blurRadius: 5.0,
          ),
        ],
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: const EdgeInsets.all(5),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                // color: Colors.grey,
                boxShadow: const [],
              ),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.event, color: Colors.black),
                  SizedBox(width: 10),
                  Flexible(
                    // flex: 1,
                    child: ExpandablePanel(
                      theme: ExpandableThemeData(
                        tapBodyToExpand: true,
                        tapBodyToCollapse: true,
                        hasIcon: (data.length > 1),
                      ),
                      header: Text(
                        data[0],
                        maxLines: 7,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Calisto'),
                      ),
                      collapsed: (data.length > 1)
                          ? Text(
                              updatedData[0] + "...",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 15),
                              softWrap: true,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            )
                          : Container(),
                      expanded: (data.length > 1)
                          ? Text(
                              // trailing.replaceAll("\\n", "\n\n● "),
                              updatedData.join("\n\n● "),
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16),
                              softWrap: true,
                            )
                          : Container(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: primaryColor,
                boxShadow: const [
                  BoxShadow(
                    color: primaryColor,
                    offset: Offset(0.0, 1.0), //(x,y)
                    blurRadius: 5.0,
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.access_time_filled, color: Colors.white),
                  SizedBox(width: 10),
                  Text(
                    leading,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Calisto'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
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
            fontFamily: 'Calisto'),
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
              fontFamily: 'Calisto'),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
