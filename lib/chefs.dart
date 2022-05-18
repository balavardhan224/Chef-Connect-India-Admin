import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paginate_firestore/paginate_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class chefs extends StatelessWidget {
  const chefs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chef Details'),
        centerTitle: true,
      ),
      body: PaginateFirestore(
        // item builder type is compulsory.
        itemBuilderType:
            PaginateBuilderType.listView, //Change types accordingly
        itemBuilder: (context, documentSnapshots, index) {
          final data = documentSnapshots[index].data() as Map?;
          return Container(
            child: GestureDetector(
              child: cheflist(
                address: data!['address'],
                cheffees: data['cheffees'],
                chefid: data['chefid'],
                city: data['city'],
                // country: data['country'],
                // cuisineexpert: data['cuisineexpert'],
                // email: data['email'],
                experience: data['experience'],
                firstname: data['firstname'],
                lastname: data['lastname'],
                level: data['level'],
                mobile1: data['mobile1'],
                rating: data['rating'],
                // verified: data['verified'],
                workpreference: data['workpreference'],
              ),
            ),
          );
        },
        // orderBy is compulsory to enable pagination
        query: FirebaseFirestore.instance.collection('chefs').orderBy('chefid'),
        itemsPerPage: 5,
        // to fetch real-time data
        isLive: true,
      ),
    );
  }

  static void updatemsg(appointid, status) async {
    CollectionReference appointmentdatbase =
        FirebaseFirestore.instance.collection("chefs");
    var result =
        await appointmentdatbase.doc(appointid).update({"verified": status});
  }
}

class cheflist extends StatefulWidget {
  late String firstname;
  late String lastname;
  late String mobile1;
  // late String email;
  late String address;
  late int cheffees;
  late String chefid;
  late String city;
  // late String country;
  // late String cuisineexpert;
  late int experience;
  late String level;
  late double rating;
  // late bool verified;
  late String workpreference;

  cheflist({
    required this.firstname,
    required this.lastname,
    required this.mobile1,
    // required this.email,
    required this.address,
    required this.cheffees,
    required this.chefid,
    required this.city,
    // required this.country,
    // required this.cuisineexpert,
    required this.experience,
    required this.level,
    required this.rating,
    // required this.verified,
    required this.workpreference,
  });

  @override
  State<cheflist> createState() => _cheflistState();
}

class _cheflistState extends State<cheflist> {
  @override
  Widget build(BuildContext context) {
    var scwidth = MediaQuery.of(context).size.width;
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
                              "${widget.firstname + widget.lastname}'s details",
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
                  width: scwidth - 20,
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
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          // mainAxisAlignment: MainAxisAlignment.spaceAround,
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${widget.firstname + widget.lastname}'s details ",
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: Colors.grey,
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),
                            ),
                            ExpandableButton(
                              theme:
                                  ExpandableThemeData(iconColor: Colors.blue),
                              child: Icon(
                                Icons.cancel_outlined,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 4,
                          left: 20,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'First Name: ',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              '${widget.firstname}',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          top: 5,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Last Name: ',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              '${widget.lastname}',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 5,
                          left: 20,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Mobile Number: ',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              '${widget.mobile1}',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'City: ',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              '${widget.city}',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          top: 5,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Address: ',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              '${widget.address}',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          top: 5,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Chef Level: ',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              '${widget.level}',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          top: 5,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Chef Fees: ',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              '\u{20B9}${widget.cheffees}',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          top: 5,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Chef Rating: ',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              '${widget.rating}',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          top: 5,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Work Preference: ',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              '${widget.workpreference}',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
