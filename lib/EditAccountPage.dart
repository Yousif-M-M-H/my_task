import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';

class EditAccount extends StatefulWidget {
  const EditAccount({super.key});

  @override
  State<EditAccount> createState() => EditAccountState();
}

class EditAccountState extends State<EditAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Icon(Icons.arrow_back_ios),
                Text(
                  " Edit Account",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          SizedBox(
            height: 14,
          ),
          Center(
            child: Container(
              width: 130.0,
              height: 130.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.green,
                  width: 2.0,
                ),
              ),
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 70.0,
                    backgroundImage: NetworkImage(
                      'https://i.pinimg.com/736x/1f/51/03/1f51038bd5af319dd132a3fab9ee3b57.jpg',
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.orange,
                      ),
                      child: IconButton(
                        icon: Icon(Icons.edit),
                        color: Colors.white,
                        onPressed: () {
                          // Handle edit button press
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 12),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(children: [
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'Name', icon: Icon(Icons.account_circle_sharp)),
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value!.isEmpty ||
                      RegExp(r'^[a-z A-Z]+$').hasMatch(value!)) {
                    return 'Please Enter a Valid Name';
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(height: 12),
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'Phone Number', icon: Icon(Icons.phone_android)),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty ||
                      RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[){0,1}[-\s\./0-9]+$')
                          .hasMatch(value!)) {
                    return 'Please Enter a correct phone number';
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(height: 12),
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'Enter your Email', icon: Icon(Icons.email)),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value!.isEmpty ||
                      RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value!)) {
                    return 'Enter a correct email';
                  } else {
                    return null;
                  }
                },
              )
            ]),
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: GestureDetector(
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //       builder: (context) => const ChangePassword()),
                // );
              },
              child: Text(
                "Change Password",
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text("Save"),
            style: ElevatedButton.styleFrom(
              fixedSize: Size.fromWidth(300),
              backgroundColor: Colors.orange,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
