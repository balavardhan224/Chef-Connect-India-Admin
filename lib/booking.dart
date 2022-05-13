import 'package:flutter/material.dart';
import 'package:paginate_firestore/paginate_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable/expandable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:url_launcher/url_launcher.dart';

class booking extends StatelessWidget {
  const booking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Booking's"),
        centerTitle: true,
      ),
      body: PaginateFirestore(
        // item builder type is compulsory.
        itemBuilderType:
            PaginateBuilderType.listView, //Change types accordingly
        itemBuilder: (context, documentSnapshots, index) {
          final dataa = documentSnapshots[index].data() as Map?;
          return Container(
            child: GestureDetector(
              child: listpredefined(
                bookingId: dataa!['bookingId'],
                bookingTime: dataa['bookingTime'],
                bookingDate: dataa['bookingDate'],
                bookingSlot: dataa['bookingSlot'],
                bookingType: dataa['bookingType'],
                chefContact: dataa['chefContact'],
                customerPhone: dataa['customerPhone'],
                numberOfPlates: dataa['numberOfPlates'],
                selectedMenu: dataa['selectedMenu'],
                withMaterial: dataa['withMaterial'],
                address: dataa['address'],
                bookingStatus: dataa['bookingStatus'],
                chefId: dataa['chefId'],
                customerId: dataa['customerId'],
                cid: dataa['cid'],
              ),
            ),
          );
        },
        // orderBy is compulsory to enable pagination
        query: FirebaseFirestore.instance.collection('bookings'),
        itemsPerPage: 5,
        // to fetch real-time data
        isLive: true,
      ),
    );
  }
}

class listpredefined extends StatefulWidget {
  late String bookingId;
  late String bookingTime;
  late String bookingDate;
  late String bookingSlot;
  late String bookingType;
  late String chefContact;
  late String customerPhone;
  late String numberOfPlates;
  late List selectedMenu;
  late bool withMaterial;
  late String address;
  late String bookingStatus;
  late String chefId;
  late String customerId;
  late String cid;
  listpredefined({
    required this.bookingId,
    required this.bookingTime,
    required this.bookingDate,
    required this.bookingSlot,
    required this.bookingType,
    required this.chefContact,
    required this.customerPhone,
    required this.numberOfPlates,
    required this.selectedMenu,
    required this.withMaterial,
    required this.address,
    required this.bookingStatus,
    required this.chefId,
    required this.customerId,
    required this.cid,
  });

  @override
  State<listpredefined> createState() => _listpredefinedState();
}

class _listpredefinedState extends State<listpredefined> {
  _makingPhoneCall(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    }
  }

  void _launchURL(_url) async {
    if (await canLaunch(_url)) {
      await launch(_url);
    } else {
      throw 'could not launch $_url';
    }
  }

  @override
  Widget build(BuildContext context) {
    var scwidth = MediaQuery.of(context).size.width;
    bool selected = false;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ExpandableNotifier(
        child: Column(
          children: [
            Expandable(
              theme: ExpandableThemeData(
                  inkWellBorderRadius: BorderRadius.circular(50)),
              collapsed: ExpandableButton(
                // theme: ExpandableThemeData(iconColor: Colors.blue),
                child: Card(
                  elevation: 5,
                  child: Container(
                    padding: const EdgeInsets.only(left: 10.0),
                    width: scwidth - 30,
                    height: 100.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(10.0),
                        right: Radius.circular(10.0),
                      ),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.16),
                          offset: Offset(0, 3.0),
                          blurRadius: 12.0,
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${widget.bookingId}'s menu",
                              style: GoogleFonts.roboto(
                                fontSize: 20.0,
                                color: const Color(0xFF4A4B4D),
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              expanded: Card(
                elevation: 5,
                child: Container(
                  padding: const EdgeInsets.only(left: 10.0),
                  width: scwidth - 50,
                  // height: 100.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(10.0),
                      right: Radius.circular(10.0),
                    ),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withOpacity(0.1),
                        offset: Offset(0, 3),
                        blurRadius: 12.0,
                      ),
                    ],
                  ),
                  child: Column(children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Row(
                                children: [
                                  Text(
                                    "${widget.bookingId}'s menu",
                                    style: GoogleFonts.roboto(
                                      fontSize: 18.0,
                                      color: const Color(0xFF4A4B4D),
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  ExpandableButton(
                                    theme: ExpandableThemeData(
                                        iconColor: Colors.blue),
                                    child: Icon(
                                      Icons.cancel_outlined,
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'dishes:',
                                  style: GoogleFonts.roboto(
                                      fontSize: 18.0,
                                      color: const Color(0xFF4A4B4D),
                                      height: 1.11,
                                      fontWeight: FontWeight.w500),
                                ),
                                Wrap(
                                  spacing: 5.0,
                                  children: widget.selectedMenu
                                      .map(
                                        (e) => Chip(
                                          backgroundColor:
                                              Colors.orange.shade100,
                                          label: Text(
                                            e.toString().toLowerCase(),
                                            style: TextStyle(
                                                color: Colors.orange.shade900,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                        ),
                                      )
                                      .toList(),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton(
                                    onPressed: () {
                                      // var url = widget.chefContact;
                                      // var p = '+919876543210';
                                      launch("tel: ${widget.customerPhone}");
                                      // const phonenumber = '9876543210';
                                      // const url = 'tel:$phonenumber';
                                      // if (await canLaunch(url)) {
                                      //   await launch('9876543210');
                                      // }
                                      // //_launchURL(widget.customerPhone);
                                    },
                                    child: Text("call customer")),
                                // Spacer(),
                                ElevatedButton(
                                    onPressed: () {
                                      launch("tel: ${widget.chefContact}");
                                    },
                                    child: Text("call chef")),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                                onPressed: () {
                                  showAlertDialog(widget.bookingId,
                                      "Are you sure to reject", "Pending");
                                },
                                child: Text("Reject")),
                            ElevatedButton(
                                onPressed: () {
                                  showAlertDialog(widget.bookingId,
                                      "Are you sure to accept", "Inprogress");
                                },
                                child: Text("In-Progress")),
                            // Spacer(),
                            // ElevatedButton(
                            //     onPressed: () {
                            //       showAlertDialog(widget.bookingId,
                            //           "Are you sure to reject", "Cancel");
                            //     },
                            //     child: Text("REJECT")),
                            // Spacer(),
                            ElevatedButton(
                                onPressed: () {
                                  showAlertDialog(widget.bookingId,
                                      "Are you sure to accept", "Success");
                                },
                                child: Text("Completed")),
                          ],
                        ),
                      ],
                    ),
                  ]),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  static void bookingupdate(bookingId, msg) async {
    CollectionReference database =
        FirebaseFirestore.instance.collection("bookings");
    var result = await database.doc(bookingId).update({"bookingStatus": msg});
  }

  void showAlertDialog(bookingId, message1, message2) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("Cancel"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = TextButton(
      child: Text("Continue"),
      onPressed: () {
        bookingupdate(widget.bookingId, message2);
        Fluttertoast.showToast(msg: message2);
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("AlertDialog"),
      content: Text(message1),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
