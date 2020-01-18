import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Form(key: _formKey, child: Column(children: <Widget>[_buildPage()]));
  }

  _buildPage() {
    return Center(
        child: TextField(
      decoration: InputDecoration(hintText: "Lütfen kullanıcı adınızı giriniz"),
    ));
  }
}
