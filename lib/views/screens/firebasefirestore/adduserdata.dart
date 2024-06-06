import 'package:fileupload/views/services/firebaseservices.dart';
import 'package:flutter/material.dart';

class AddUsersData extends StatelessWidget {
  const AddUsersData({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameControoler = TextEditingController();
    TextEditingController addressController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController= TextEditingController();
    FirebaseServices firebaseServices = FirebaseServices();
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Users Data"),
        backgroundColor: Colors.indigo,
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          TextField(
            controller: nameControoler,
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
            controller: addressController,
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
                label: Text("EmailId"),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),),
                hintText: "Enter Your Email",
                prefixIcon: Icon(Icons.email)
            ),
          ), SizedBox(height: 10,),
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
          SizedBox(height: 20,),
          ElevatedButton.icon(onPressed: (){
            firebaseServices.addUserData(nameControoler.text, addressController.text, emailController.text, passwordController.text);
          }, label: Text("Registions"),icon: Icon(Icons.app_registration),)
        ],
      ),
    );
  }
}
