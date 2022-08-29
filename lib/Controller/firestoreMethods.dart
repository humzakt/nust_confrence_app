// import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nust_conference/widgets/papers/TimelineTile.dart';
import 'package:provider/provider.dart';

import '../provider/loggedInProvider.dart';

class GetSchedule extends StatefulWidget {
  final String date;

  const GetSchedule({Key? key, required this.date}) : super(key: key);

  @override
  State<GetSchedule> createState() => _GetScheduleState();
}

class _GetScheduleState extends State<GetSchedule> {
  late final FirebaseFirestore _firestore =
      Provider.of<AdminProvider>(context, listen: false).firestore;
  bool isLoggedIn = false;
  //Bool to check if collection has docs or not
  bool isCollectionEmpty = true;

  checkCollection() async {
    var snap = await _firestore.collection('conference 2022').get();
    if (snap.docs.isNotEmpty) {
      setState(() {
        isCollectionEmpty = false;
      });
    } else {
      setState(() {
        isCollectionEmpty = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    checkCollection();
    isLoggedIn = Provider.of<AdminProvider>(context, listen: false).isLoggedIn;
  }

  @override
  Widget build(BuildContext context) {
    return isCollectionEmpty
        ? Container(
            child: Center(
              child:
                  Text("", style: TextStyle(fontSize: 20, color: Colors.white)),
            ),
          )
        : StreamBuilder<QuerySnapshot>(
            stream: _firestore
                .collection("conference 2022")
                .doc(widget.date)
                .collection("schedule")
                .orderBy('timestamp')
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.lightBlueAccent,
                  ),
                );
              } else if (snapshot.data!.docs.length == 0) {
                print("No Event on this date");
                // Deleting Date with no event!
                _firestore
                    .collection("conference 2022")
                    .doc(widget.date)
                    .delete();
              }

              return ListView(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> data =
                      document.data()! as Map<String, dynamic>;
                  print("data is : \n");
                  print(data.toString());
                  String time = DateFormat.yMMMd()
                      .add_jm()
                      .format(data['timestamp'].toDate());

                  // print(time.split(" ")[3] + " " + time.split(" ")[4]);
                  time = time.split(" ")[3] + " " + time.split(" ")[4];
                  return isLoggedIn
                      ? editableScheduleWidget(
                          eventName: data['event'].toString(),
                          eventDateTime: data['timestamp'].toDate(),
                          document: document,
                        )
                      : TimelineTileWidget(
                          leading: time,
                          trailing: data['event'].toString(),
                        );
                }).toList(),
              );
            },
          );
  }
}

class editableScheduleWidget extends StatelessWidget {
  String eventName;
  DateTime eventDateTime;

  DocumentSnapshot document;

  editableScheduleWidget(
      {Key? key,
      required this.eventName,
      required this.eventDateTime,
      required this.document})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: Colors.grey,
          width: 1,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Delete Event"),
                      content:
                          Text("Are you sure you want to delete this event?"),
                      actions: <Widget>[
                        TextButton(
                          child: Text("Cancel"),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: Text("Delete"),
                          onPressed: () {
                            document.reference.delete();
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  });

              // document.reference.delete();
            },
            icon: Icon(
              Icons.cancel_outlined,
              color: Colors.red,
              size: 40,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Flexible(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  eventName,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                  // overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  eventDateTime.toString().split(" ")[1].split(".")[0],
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 10,
          ),
          IconButton(
            icon: Icon(
              Icons.access_time,
              size: 40,
            ),
            color: Colors.white,
            onPressed: () async {
              DateTime oldDate = this.eventDateTime;

              DateTime newDate;

              await showTimePicker(
                context: context,
                initialTime: TimeOfDay(
                    hour: eventDateTime.hour, minute: eventDateTime.minute),
              ).then((value) {
                print(value);
                if (value == null) return;
                newDate = DateTime(
                  oldDate.year,
                  oldDate.month,
                  oldDate.day,
                  value.hour,
                  value.minute,
                );

                print(newDate);
                updateEvent(eventName, newDate);
              });
            },
          )
        ],
      ),
    );
  }

  void updateEvent(String eventName, DateTime date) {
    print(eventName);
    print(date.toString());
    document.reference.update({
      'event': eventName,
      'timestamp': date,
    });
  }
}
