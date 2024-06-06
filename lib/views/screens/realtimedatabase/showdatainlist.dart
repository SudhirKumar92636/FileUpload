import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ShowListData extends StatefulWidget {
  const ShowListData({Key? key}) : super(key: key);

  @override
  State<ShowListData> createState() => _ShowListDataState();
}

class _ShowListDataState extends State<ShowListData> {
  final ref = FirebaseDatabase.instance.ref("students");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Show List Data"),
        backgroundColor: Colors.indigo,
      ),

      body: Column(
        children: [
          Expanded(
            child: FirebaseAnimatedList(query:FirebaseDatabase.instance.ref("Users") ,itemBuilder: (context, snapshot, animation, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(snapshot.child("name").value.toString()),
                  Text(snapshot.child("address").value.toString()),
                  Text(snapshot.child("email").value.toString()),
                  Text(snapshot.child("password").value.toString()),
                  Text(snapshot.child("phone").value.toString())
                ],
              );
            },),
          )
        ],
      ),
    );
  }
}
