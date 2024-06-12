import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseServices {
  void addUserData(String name, String address, String email, String password) {
    var id = FirebaseAuth.instance.currentUser?.uid;
    if (id == null) {
      print("No user is currently signed in.");
      return;
    }

    final users = FirebaseFirestore.instance.collection("Users");

    // Add a new document with provided data including id
    users.doc(id).set({
      'id': id, // Add the user id here
      'name': name,
      'address': address,
      'email': email,
      'password': password,
    }).then((value) {
      print("User Added");
    }).catchError((error) {
      print("Failed to add user: $error");
    });
  }
}
