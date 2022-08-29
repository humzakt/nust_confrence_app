import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nust_conference/Controller/firestoreMethods.dart';
import 'package:nust_conference/provider/loggedInProvider.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../Models/appBar.dart';
import '../Models/appDrawer.dart';
import '../colors.dart';

class ProgrammeScreen extends StatefulWidget {
  const ProgrammeScreen({Key? key}) : super(key: key);

  @override
  State<ProgrammeScreen> createState() => _ProgrammeScreenState();
}

class _ProgrammeScreenState extends State<ProgrammeScreen> {
  //Initial Dropdown Value
  String dropdownvalue = '';

  // List of items in our dropdown menu
  List<String> items = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    updateItems();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          backgroundColor: primaryColor,

          drawer: appDrawer(),
          // App Bar Widget Used
          resizeToAvoidBottomInset: false,

          appBar: AppBarWidget(title: "Programme Schedule"),
          body: isLoading
              ? Center(child: CircularProgressIndicator())
              : Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ListView(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    children: [
                      Provider.of<AdminProvider>(context, listen: false)
                              .isLoggedIn
                          ? adminPanel()
                          : Container(),
                      Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.all(10),
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: backgroundColor,
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0.0, 1.0), //(x,y)
                              blurRadius: 5.0,
                            ),
                          ],
                        ),
                        child: items.isEmpty
                            ? Container()
                            : DropdownButtonHideUnderline(
                                child: DropdownButton(
                                  // Initial Value
                                  value: dropdownvalue,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),

                                  // Down Arrow Icon
                                  icon: const Icon(
                                    Icons.keyboard_arrow_down,
                                    color: Colors.black,
                                    size: 30,
                                  ),

                                  // Array list of items
                                  items: items.map((String items) {
                                    return DropdownMenuItem(
                                      value: items,
                                      child: Text(items),
                                    );
                                  }).toList(),

                                  // items.map((String items) {
                                  //   return DropdownMenuItem(
                                  //     value: items,
                                  //     child: Text(items),
                                  //   );
                                  //
                                  // }).toList(),
                                  // After selecting the desired option,it will
                                  // change button value to selected value
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      dropdownvalue = newValue!;
                                    });
                                  },
                                ),
                              ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02),
                      GetSchedule(
                        date: dropdownvalue,
                      ),
                    ],
                  ),
                ),
        ));
  }

  Future<void> updateItems() async {
    setState(() {
      isLoading = true;
    });
    FirebaseFirestore _firestore =
        Provider.of<AdminProvider>(context, listen: false).firestore;

    List<QueryDocumentSnapshot> snapshot =
        (await _firestore.collection("conference 2022").get()).docs.toList();
    List<String> newItems = [];
    for (QueryDocumentSnapshot snap in snapshot) {
      String name = snap.reference.path.toString().split("/")[1];
      print(name);
      newItems.add(name);
    }
    if (newItems.isNotEmpty) {
      setState(() {
        items = newItems;
        dropdownvalue = items[0];
        isLoading = false;
      });
    }
    setState(() {
      isLoading = false;
    });
  }
}

class adminPanel extends StatefulWidget {
  adminPanel({
    Key? key,
  }) : super(key: key);

  @override
  State<adminPanel> createState() => _adminPanelState();
}

class _adminPanelState extends State<adminPanel> {
  String eventName = "";
  late DateTime date;
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(
        "Admin Panel",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
      SizedBox(
        height: 10,
      ),
      Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: _controller,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 2.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                ),
                border: OutlineInputBorder(),
                labelText: "Event Name",
                labelStyle: TextStyle(
                  color: Colors.white,
                ),
              ),
              style: TextStyle(
                color: Colors.white,
              ),
              onChanged: (value) {
                setState(() {
                  eventName = value;
                });
              },
            ),
          ),
          _controller.text.isNotEmpty
              ? IconButton(
                  onPressed: () async {
                    _controller.clear();
                    showDatePicker(
                            context: context,
                            initialDate: DateTime(2022, 12, 15),
                            firstDate: DateTime(2021),
                            lastDate: DateTime(2100))
                        .then((value) {
                      if (value == null) return;

                      date = value;
                      showTimePicker(
                              context: context,
                              initialTime: TimeOfDay(hour: 0, minute: 0))
                          .then((value) {
                        if (value == null) return;

                        date = DateTime(date.year, date.month, date.day,
                            value.hour, value.minute);

                        Timestamp timestamp = Timestamp.fromDate(date);
                        print(date);
                        updateFirebase(date, timestamp, eventName);
                      });
                    });
                    FocusManager.instance.primaryFocus?.unfocus();
                    // updateItems();
                  },
                  icon: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 30,
                  ),
                )
              : Container(),
        ],
      ),
      SizedBox(
        height: 10,
      ),
    ]);
  }

  updateFirebase(DateTime date, Timestamp timestamp, String eventName) async {
    print("hello");
    print(timestamp.toString());
    final FirebaseFirestore _firestore =
        Provider.of<AdminProvider>(context, listen: false).firestore;

    String time = DateFormat.yMMMd().add_jm().format(timestamp.toDate());

    String collName = time.split(" ")[0] +
        " " +
        time.split(" ")[1] +
        " " +
        time.split(" ")[2];
    print(collName);

    _firestore.collection("conference 2022").doc(collName).set({
      "last updated": Timestamp.fromDate(DateTime.now()),
    });

    _firestore
        .collection("conference 2022")
        .doc(collName)
        .collection("schedule")
        .add({
      "timestamp": timestamp,
      "event": eventName,
    });
  }
}
