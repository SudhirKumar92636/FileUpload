import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class GetStreamData extends StatefulWidget {
  const GetStreamData({Key? key}) : super(key: key);

  @override
  State<GetStreamData> createState() => _GetStreamDataState();
}

class _GetStreamDataState extends State<GetStreamData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Get Stream Data"),
        backgroundColor: Colors.indigo,
      ),
      body: StreamBuilder(
        stream: FirebaseDatabase.instance.ref("Students").onValue,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData && snapshot.data!.snapshot.value != null) {
            // Extract data from snapshot
            Map<dynamic, dynamic> data = snapshot.data!.snapshot.value as Map<dynamic, dynamic>;
            List<dynamic> items = data.values.toList();

            return ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                Map student = items[index];
                return ListTile(
                  leading: CircleAvatar(
                    child: Text(student['name'][0].toUpperCase()),
                  ),
                  title: Text(student['name']),
                  subtitle: Text(student['address']),
                );
              },
            );
          } else {
            return Center(child: Text("No Data Found"));
          }
        },
      ),
    );
  }
}
