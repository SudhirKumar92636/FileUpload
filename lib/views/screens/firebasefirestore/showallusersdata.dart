import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserInfo extends StatefulWidget {
  const UserInfo({Key? key}) : super(key: key);

  @override
  State<UserInfo> createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Show User Info"),
        backgroundColor: Colors.grey,
      ),
      body: Container(
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection("Students").snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  var userData = snapshot.data!.docs[index].data() as Map<String, dynamic>;
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        if (userData["Image"] != null)
                          Center(
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(userData["Image"]),
                              radius: 50,
                            ),
                          ),
                        Text(
                          "Email: ${userData["Email"]}",
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  );
                },
              );
            } else {
              return Center(
                child: Text("No Data Found"),
              );
            }
          },
        ),
      ),
    );
  }
}
