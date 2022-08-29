import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nust_conference/widgets/speakers/speakerCard.dart';

class GetSpeakers extends StatefulWidget {
  const GetSpeakers({
    Key? key,
  }) : super(key: key);

  @override
  State<GetSpeakers> createState() => _GetSpeakersState();
}

class _GetSpeakersState extends State<GetSpeakers> {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection("Speakers").snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ),
          );
        }
        return ListView(
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data =
                document.data()! as Map<String, dynamic>;
            String img = "";
            if (data['image'] != null) {
              img = data['image'].toString();
            }
            return ProfileDisplayWidget(
              imageUrl: img,
              name: data['name'].toString(),
              description: data['description'].toString(),
            );
          }).toList(),
        );
      },
    );
  }
}
