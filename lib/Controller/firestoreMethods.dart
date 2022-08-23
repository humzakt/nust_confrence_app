import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nust_conference/widgets/papers/TimelineTile.dart';

class GetSchedule extends StatefulWidget {
  final String date;
  const GetSchedule({Key? key, required this.date}) : super(key: key);

  @override
  State<GetSchedule> createState() => _GetScheduleState();
}

class _GetScheduleState extends State<GetSchedule> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream:
          _firestore.collection(widget.date).orderBy('timestamp').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ),
          );
        }
        return ListView(
          shrinkWrap: true,
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data =
                document.data()! as Map<String, dynamic>;
            String time =
                DateFormat.yMMMd().add_jm().format(data['timestamp'].toDate());

            return TimelineTileWidget(
              leading: time,
              trailing: data['event'].toString(),
            );
          }).toList(),
        );
      },
    );
  }
}
