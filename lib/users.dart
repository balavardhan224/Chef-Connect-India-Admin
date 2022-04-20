import 'package:flutter/material.dart';
import 'package:paginate_firestore/paginate_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class users extends StatelessWidget {
  const users({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firestore pagination example'),
        centerTitle: true,
      ),
      body: PaginateFirestore(
        // item builder type is compulsory.
        itemBuilderType:
            PaginateBuilderType.listView, //Change types accordingly
        itemBuilder: (context, documentSnapshots, index) {
          final data = documentSnapshots[index].data() as Map?;
          return ListTile(
            leading: const CircleAvatar(child: Icon(Icons.person)),
            title: data == null
                ? const Text('Error in data')
                : Text(data['firstname']),
          );
        },
        // orderBy is compulsory to enable pagination
        query:
            FirebaseFirestore.instance.collection('users').orderBy('username'),
        itemsPerPage: 5,
        // to fetch real-time data
        isLive: true,
      ),
    );
  }
}
