import 'package:fileupload/imgesscreens.dart';
import 'package:flutter/material.dart';

class HomeScreens extends StatelessWidget {
  const HomeScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screens"),
        backgroundColor: Colors.red,

      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20,left: 59),
        child: Column(
          
          children: [
            ElevatedButton.icon(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => AddImagesScreens(),));
              },
               icon: Icon(Icons.image),
                label: Text("Add Images"),)
          ],
        ),
      ),
    );
  }
}