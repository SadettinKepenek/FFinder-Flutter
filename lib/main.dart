import 'package:ffinder/screens/LoginPage.dart';
import 'package:flutter/material.dart';

// Test
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        buttonColor: Colors.white,
        buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary)
      ),
      home: Scaffold(
          body: LoginPage(),
          appBar: AppBar(
            title: Text("FFinder"),
          )),
    );
  }
}
