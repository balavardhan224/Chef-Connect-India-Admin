import 'package:flutter/material.dart';
import 'package:paginate_firestore/paginate_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class users extends StatelessWidget {
  const users({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Customers'),
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
              child: userlist(
                firstname: data!['firstname'],
                lastname: data['lastname'],
                mobile1: data['mobile1'],
                email: data['email'],
                selectedLocation: data['selectedLocation'],
                hiremode: data['hiremode'],
              ),
            ),
          );
        },
        // orderBy is compulsory to enable pagination
        query: FirebaseFirestore.instance.collection('users'),
        itemsPerPage: 5,
        // to fetch real-time data
        isLive: true,
      ),
    );
  }
}

class userlist extends StatefulWidget {
  late String firstname;
  late String lastname;
  late String mobile1;
  late String email;
  late String selectedLocation;
  late String hiremode;
  userlist({
    required this.firstname,
    required this.lastname,
    required this.mobile1,
    required this.email,
    required this.selectedLocation,
    required this.hiremode,
  });

  @override
  State<userlist> createState() => _userlistState();
}

class _userlistState extends State<userlist> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
