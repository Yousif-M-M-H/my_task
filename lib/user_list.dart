import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'UpdateRecoreds.dart';

class GetUserName extends StatelessWidget {
  const GetUserName({Key? key, required this.documentId}) : super(key: key);

  final String documentId;

  // bool _isUpdateSuccessful = false;
  void navigateToUpdateScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => UpdateRecord(userKey: documentId)),
    );
  }

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          Timestamp? birthdayTimestamp = data['birthday'] as Timestamp?;
          DateTime? birthday =
              birthdayTimestamp != null ? birthdayTimestamp.toDate() : null;
          String birthdayFormatted =
              birthday != null ? DateFormat.yMd().format(birthday) : '';
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: InkWell(
                onTap: () => navigateToUpdateScreen(context),
                child: ListTile(
                  title: Text('Name: ${data['name']}'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Age: ${data['age']}'),
                      Text('birthday is $birthdayFormatted'),
                      ElevatedButton(
                          onPressed: () {
                            users.doc(documentId).delete();
                          },
                          child: Icon(Icons.delete))
                    ],
                  ),
                  trailing: Icon(Icons.edit),
                ),
              ),
            ),
          );
        }
        return Text('Loading...');
      },
    );
  }
}
