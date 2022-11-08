import 'package:flutter/material.dart';
import 'package:grocery_dashboard/mainpg.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grocery Dashboard',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: Mainpage(),
    );
  }
}
