import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class ShowUserInfo extends StatefulWidget {
  const ShowUserInfo({Key? key}) : super(key: key);

  @override
  State<ShowUserInfo> createState() => _ShowUserInfoState();
}

class _ShowUserInfoState extends State<ShowUserInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor:Color(0xFFE383B7),
        actions: [
          ElevatedButton.icon(
            onPressed: _showLogoutDialog,
            icon: const Icon(Icons.logout, color: Colors.white,size: 30,),
            style: ElevatedButton.styleFrom(
              backgroundColor:Color(0xFFE383B7),
            ), label: Text(""),
          ),

        ],
      ),
      body: Container(
        color: Colors.blueGrey,
        child: StreamBuilder<DocumentSnapshot?>(
          stream: FirebaseFirestore.instance
              .collection("Students")
              .doc(FirebaseAuth.instance.currentUser?.uid)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else if (snapshot.hasData && snapshot.data!.exists) {
              var userData = snapshot.data!;

              return Center(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 500,
                        decoration: BoxDecoration(
                          color: Colors.black26,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              if (userData["Image"] != null)
                                Center(
                                  child: CircleAvatar(
                                    backgroundImage:
                                    NetworkImage(userData["Image"]),
                                    radius: 80,
                                  ),
                                ),
                              SizedBox(height: 10,),


                              TextFormField(
                                readOnly: true,
                                initialValue: userData["Email"] ?? "",
                                style: const TextStyle(fontSize: 20),
                                decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.email),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10)
                                    )
                                ),
                              ),
                              SizedBox(height: 25,),

                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
            } else {
              return const Center(
                child: Text("No Data Found"),
              );
            }
          },
        ),
      ),
    );
  }

  Future<void> _signOut() async {
    try {
      await FirebaseAuth.instance.signOut();

    } catch (e) {
      print("Error signing out: $e");
    }
  }

  void _showLogoutDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Confirm Logout"),
          content: const Text("Are you sure you want to logout?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                _signOut();
              },
              child: const Text("Logout"),
            ),
          ],
        );
      },
    );
  }
}
