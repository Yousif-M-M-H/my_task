import 'package:flutter/material.dart';
import 'package:my_task/changePassword.dart';
import './ProductDetails.dart';
import './ProfilePage.dart';
import 'MyOrders.dart';
import 'CourierBids.dart';
import 'MainProfilePage.dart';
import 'CourierBids2.dart';
import 'FireTry.dart';
import 'package:firebase_core/firebase_core.dart';
import './user_list.dart';
import 'UsrEnterInfo.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hello world',
      theme: ThemeData(
        // is not restarted.
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'product details'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [Text("hello")]),
    );
  }
}
