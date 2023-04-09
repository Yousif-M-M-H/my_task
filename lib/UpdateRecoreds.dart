import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UpdateRecord extends StatefulWidget {
  final userKey;
  const UpdateRecord({Key? key, required this.userKey}) : super(key: key);

  @override
  State<UpdateRecord> createState() => _UpdateRecordState();
}

class _UpdateRecordState extends State<UpdateRecord> {
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final dobController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    ageController.dispose();
    dobController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    return Scaffold(
      appBar: AppBar(
        title: Text('Update Record'),
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future: users.doc(widget.userKey).get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            Timestamp? birthdayTimestamp = data['birthday'] as Timestamp?;
            DateTime? birthday =
                birthdayTimestamp != null ? birthdayTimestamp.toDate() : null;
            String birthdayFormatted =
                birthday != null ? DateFormat.yMd().format(birthday) : '';

            // Populate input fields with user data
            nameController.text = data['name'] ?? '';
            ageController.text = data['age']?.toString() ?? '';
            dobController.text = birthdayFormatted;

            return Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      labelText: 'Name',
                    ),
                  ),
                  TextField(
                    controller: ageController,
                    decoration: InputDecoration(
                      labelText: 'Age',
                    ),
                  ),
                  TextField(
                    controller: dobController,
                    decoration: InputDecoration(
                      labelText: 'Birthdate',
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Update the document with the new information
                      users.doc(widget.userKey).update({
                        'name': nameController.text,
                        'age': int.tryParse(ageController.text) ?? null,
                        'birthday': dobController.text.isNotEmpty
                            ? Timestamp.fromDate(
                                DateFormat.yMd().parse(dobController.text))
                            : null,
                      }).then((_) {
                        // Return to the previous screen after the document is updated
                        Navigator.pop(context);
                      }).catchError((error) {
                        // Handle errors
                        print(error);
                      });
                    },
                    child: Text('Save'),
                  )
                ],
              ),
            );
          }

          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
