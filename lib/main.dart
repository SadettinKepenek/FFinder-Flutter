import 'package:ffinder/screens/LoginPage.dart';
import 'package:ffinder/screens/homepage.dart';
import 'package:flutter/material.dart';
// Test
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: new Material(
        child: LoginPage(),
      ),
    );
  }
}