import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class InsertUsers extends StatefulWidget {
  const InsertUsers({super.key});

  @override
  State<InsertUsers> createState() => _InsertUsersState();
}

class _InsertUsersState extends State<InsertUsers> {
  TextEditingController nameController = TextEditingController();
  TextEditingController homeController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Insert Users"),
        backgroundColor: Colors.indigo,
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          TextField(
            controller: nameController,
            decoration: InputDecoration(
                label: Text("Username"),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),),
                hintText: "Enter Your Username",
                prefixIcon: Icon(Icons.person)
            ),
          ),
          SizedBox(height: 10,),
          TextField(
            controller:homeController,
            decoration: InputDecoration(
                label: Text("Address"),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),),
                hintText: "Enter Your Address",
                prefixIcon: Icon(Icons.home_outlined)
            ),
          ),
          SizedBox(height: 10,),
          TextField(
            controller: emailController,
            decoration: InputDecoration(
                label: Text("Email"),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),),
                hintText: "Enter Your Email",
                prefixIcon: Icon(Icons.email)
            ),
          ),
          SizedBox(height: 10,),
          TextField(
            controller: passwordController,
            decoration: InputDecoration(
                label: Text("Password"),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),),
                hintText: "Enter Your Password",
                prefixIcon: Icon(Icons.lock)
            ),
          ),
          SizedBox(height: 10,),
          TextField(
            controller: phoneController,
            decoration: InputDecoration(
                label: Text("Phone Number"),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),),
                hintText: "Enter Your Phone Number",
                prefixIcon: Icon(Icons.call)
            ),
          ),
          SizedBox(height: 20,),
          ElevatedButton(onPressed: (){
           // var id = FirebaseAuth.instance.currentUser?.uid;
            String id = FirebaseDatabase.instance.ref().child("Users").push().key ?? "";
           FirebaseDatabase.instance.ref().child("Users").child(id).set({
             "Id":id,
             "name":nameController.text,
             "address":homeController.text,
             "email":emailController.text,
             "password":passwordController.text,
             "phone":phoneController.text

           });
          }, child: Text("Insert Users"))
        ],
      ),
    );
  }
}
