import 'dart:io';

import 'package:ffinder/models/User_DataTransferObjects/UserLoginResponseDto.dart';
import 'package:ffinder/services/ApiService.dart';
import 'package:ffinder/services/ImagePickerService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostCreatePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PostCreateState();
}

class PostCreateState extends State<PostCreatePage> {
  File _image;
  UserLoginResponseDto _userResponse;
  Widget _mainWidget;
  UserLoginResponseDto get userResponse {
    return _userResponse;
  }

  @override
  void initState() {
    super.initState();
  }

  Future sleep1() {
    return new Future.delayed(const Duration(seconds: 5), () => "1");
  }

  getUser() async {
    await sleep1();
    var response = await StorageService.getAuth();
    this._userResponse = response;
    mainWidget = completedPage;
  }

  set mainWidget(Widget widget) {
    if (!mounted) return;
    setState(() {
      _mainWidget = widget;
    });
  }

  Widget get mainWidget {
    if (userResponse == null) {
      return loadingPage;
    } else {
      return completedPage;
    }
  }

  @override
  Widget build(BuildContext context) {
    getUser();

    var widget = Material(
        child: Scaffold(
            appBar: AppBar(
              title: Text("Create Post"),
            ),
            body: mainWidget));
    return widget;
  }

  Widget get loadingPage {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[CircularProgressIndicator()],
      ),
    );
  }

  Widget get completedPage {
    return Container(
      margin: EdgeInsets.all(25.0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              CircleAvatar(
                backgroundImage: NetworkImage("https://picsum.photos/200/300"),
                radius: 32,
                backgroundColor: Colors.transparent,
              ),
              Container(
                  margin: EdgeInsets.all(9.0),
                  child: Text(
                    userResponse.username,
                    style: TextStyle(fontSize: 20.0),
                  ))
            ],
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 10,
          ),
          Row(children: <Widget>[
            Expanded(
              child: TextField(
                style: TextStyle(fontSize: 16.0),
                decoration:
                    InputDecoration.collapsed(hintText: 'Bir şeyler yazın..'),
                keyboardType: TextInputType.multiline,
                maxLines: null,
                maxLength: 150,
                maxLengthEnforced: true,
              ),
            ),
          ]),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 10,
          ),
          Row(
            children: <Widget>[],
          ),
          Row(
            children: <Widget>[
              
            ],
          )
        ],
      ),
    );
  }

  pickImageFromGallery() async {
    var result = await ImagePickerService().getImageFromGallery();
    setState(() {
      _image = result;
    });
  }

  pickImageFromCamera() async {
    var result = await ImagePickerService().getImageFromCamera();
    setState(() {
      _image = result;
    });
  }

  Widget displayImage() {
    return _image == null ? Text('No image selected.') : Image.file(_image);
  }
}
