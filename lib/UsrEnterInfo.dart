import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'FireTry.dart';

class EnterInfo extends StatefulWidget {
  const EnterInfo({Key? key}) : super(key: key);

  @override
  State<EnterInfo> createState() => _EnterInfoState();
}

class _EnterInfoState extends State<EnterInfo> {
  final _FirstNameController = TextEditingController();
  final _AgeController = TextEditingController();
  final _BirthdayController = TextEditingController();

  bool _isProcessing = false;

  List<String> docIDs = [];

  Future<void> addUserDetails(
      String FirstName, int age, DateTime birthday) async {
    setState(() {
      _isProcessing = true;
    });

    await FirebaseFirestore.instance
        .collection('users')
        .add({'name': FirstName, 'age': age, 'birthday': birthday});

    setState(() {
      _isProcessing = false;
    });

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => FireTry(),
      ),
    );
    _FirstNameController.text = '';
    _AgeController.text = '';
    _BirthdayController.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Home Page'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _FirstNameController,
              decoration: InputDecoration(
                labelText: 'Name',
              ),
            ),
            TextField(
              controller: _AgeController,
              decoration: InputDecoration(
                labelText: 'Age',
              ),
            ),
            TextField(
              controller: _BirthdayController,
              decoration: InputDecoration(
                labelText: 'Birthdate',
              ),
            ),
            StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return _isProcessing
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : ElevatedButton(
                        onPressed: () {
                          addUserDetails(
                              _FirstNameController.text.trim(),
                              int.parse(_AgeController.text.trim()),
                              DateTime.parse(_BirthdayController.text.trim()));
                        },
                        child: Text('Add user'),
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}
