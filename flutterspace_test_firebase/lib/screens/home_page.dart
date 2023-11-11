import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection("users");

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            TextField(
              decoration: InputDecoration(hintText: "Enter a note"),
            ),
            ElevatedButton(
              onPressed: () async {
                await users.add({'name': 'Nam', 'age': 19, 'notes': 'Sad'}).then(
                    (value) => print("User added"));
              },
              child: Text("Submit data"),
            )
          ],
        ),
      ),
    );
  }
}
