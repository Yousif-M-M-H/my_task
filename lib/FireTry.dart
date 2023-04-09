import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import './user_list.dart';

class FireTry extends StatelessWidget {
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final birthdayController = TextEditingController();

  //document ids
  List<String> docIDs = [];

  Future getDocIDs() async {
    await FirebaseFirestore.instance
        .collection('users')
        .orderBy('age', descending: true)
        .get()
        .then((snapshot) => snapshot.docs.forEach((document) {
              // print(document.reference);
              docIDs.add(document.reference.id);
            }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Firebase"),
      ),
      body: Column(
        children: [
          Text("users"),
          Expanded(
            child: FutureBuilder(
              future: getDocIDs(),
              builder: (context, snapshot) {
                return ListView.builder(
                    itemCount: docIDs.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: GetUserName(documentId: docIDs[index]),
                      );
                    });
              },
            ),
          ),
        ],
      ),
    );
  }
}
