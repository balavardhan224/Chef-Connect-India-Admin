import 'package:flutter/material.dart';
import 'package:paginate_firestore/paginate_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class chefs extends StatelessWidget {
  const chefs({Key? key}) : super(key: key);

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
          return Column(
            children: [
              Row(
                children: [
                  Text(data!['chefid']),
                  ElevatedButton(
                      onPressed: () {
                        var a = (data['uid']);
                        print(a);
                        updatemsg(a, true);
                      },
                      child: Text("Veify"))
                ],
              )
            ],

            // Text(data['chefid']),
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
