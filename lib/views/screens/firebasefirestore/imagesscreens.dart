import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagesPages extends StatefulWidget {
  const ImagesPages({super.key});

  @override
  State<ImagesPages> createState() => _ImagesPagesState();
}

class _ImagesPagesState extends State<ImagesPages> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  File ? pickedImages;
  showAlertBox(){
    return showDialog(context: context, builder: (BuildContext context) {
      return  AlertDialog(
        title: Text("Pick Image From "),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              onTap: (){
                pickImage(ImageSource.camera);
                Navigator.pop(context);
              },
              leading: Icon(Icons.camera_alt),
              title: Text("Camera"),
            ),
            ListTile(
              onTap: (){
                pickImage(ImageSource.gallery);
                Navigator.pop(context);
              },
              leading: Icon(Icons.image),
              title: Text("Gallery"),
            )
          ],
        ),
      );
    },);
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Images"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: (){
                  showAlertBox();
                },
                child: pickedImages!=null?CircleAvatar(
                  maxRadius: 80,
                  backgroundImage: FileImage(pickedImages!),
                ): const CircleAvatar(
                  maxRadius: 100,
                  child: Icon(Icons.person,size: 80,),
                ),
              ),
              const SizedBox(height: 10,),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),prefixIcon: const Icon(Icons.email),
                  hintText: "Enter Your Email address",
                  label: const Text("Email")
                ),
              ),
              const SizedBox(height: 10,),
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),prefixIcon: const Icon(Icons.lock),
                    hintText: "Enter Your Email Password",
                    label: const Text("Email")
                ),
              ),
              const SizedBox(height: 20,),
              ElevatedButton(onPressed: (){
                signUp(emailController.text.toString(),passwordController.text.toString());
              }, child: const Text("Add User"),style: ElevatedButton.styleFrom(

              ),)
            ],
          ),
        ),
      ),
    );
  }
  // pick Image Method

  pickImage(ImageSource imageSource)async{
    try{
      final photo = await ImagePicker().pickImage(source: imageSource);
      if(photo == null) return null;
      final tempImage = File(photo.path);
      setState(() {
        pickedImages =tempImage;
      });
    }catch(ex){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${ex.toString()}")));
    }
  }

  // Signup Users
  signUp(String email , String password)async{
    if(email == "" && password== "" && pickedImages == null){
      return showDialog(context: context, builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Enter Required All Fields"),
          actions: [
            TextButton(onPressed: (){
              Navigator.pop(context);
            }, child: Text("Ok"))
          ],
        );
      },);
    }else{
      UserCredential? userCredential;
      try{
        userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: email,
            password: password).then((value) {
              uploadData();
        });
      }on FirebaseAuthException catch(ex){
        log(ex.code.toString());
      }
    }
  }

  // uploadData firebase

  uploadData()async{
    UploadTask uploadTask = FirebaseStorage.instance.ref("Profile Pick").child(emailController.text.toString()).putFile(pickedImages!);
    TaskSnapshot taskSnapshot = await uploadTask;
   // var id = FirebaseAuth.instance.currentUser?.uid;
    String url = await taskSnapshot.ref.getDownloadURL();
   var id = FirebaseAuth.instance.currentUser?.uid;
     FirebaseFirestore.instance.collection("Students").doc(id).set({
       "ID":id,
       "Email": emailController.text.toString(),
       "Image":url
     }).then((value) {
       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("File Upload Success full")));
     });
  }
}
