import 'package:fileupload/firebase_options.dart';
import 'package:fileupload/homescreens.dart';
import 'package:fileupload/views/screens/firebasefirestore/adduserdata.dart';
import 'package:fileupload/views/screens/firebasefirestore/imagesscreens.dart';
import 'package:fileupload/views/screens/firebasefirestore/showallusersdata.dart';
import 'package:fileupload/views/screens/firebasefirestore/showcurrentusers.dart';
import 'package:fileupload/views/screens/realtimedatabase/getdatainstream.dart';
import 'package:fileupload/views/screens/realtimedatabase/insertcurrentusers.dart';
import 'package:fileupload/views/screens/realtimedatabase/showdatainlist.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: GetStreamData(),
    );
  }
}
