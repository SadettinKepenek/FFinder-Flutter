import 'dart:io';

import 'package:ffinder/models/Post_DataTransferObjects/PostAddDto.dart';
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
  final _formKey = GlobalKey<PostCreateState>();
  File _image;
  UserLoginResponseDto _userResponse;
  Widget _mainWidget;
  UserLoginResponseDto get userResponse {
    return _userResponse;
  }

  PostAddDto postAddDto;

  @override
  void initState() {
    super.initState();
    postAddDto = new PostAddDto();
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
              actions: <Widget>[
                FlatButton(
                  child: Text("Paylaş"),
                  onPressed: () {},
                )
              ],
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
    return Form(
        child: Container(
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
                onChanged: (String value){
                 postAddDto.postBody = value;
                },

              ),
            ),
          ]),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 10,
          ),
          Expanded(
              child: Row(
            children: <Widget>[
              Center(
                child: _image == null
                    ? Text('Lütfen bir resim yükleyin.')
                    : Image.file(
                        _image,
                        width: 350,
                        height: 280,

                      ),
              )
            ],
          )),
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                      child: Align(
                          alignment: FractionalOffset.bottomLeft,
                          child: RaisedButton.icon(
                            label: Text("Kameradan Yükle"),
                            icon: Icon(Icons.camera_alt),
                            onPressed: () {
                              pickImageFromCamera();
                            },
                          ))),
                  Expanded(
                      child: Align(
                          alignment: FractionalOffset.bottomRight,
                          child: RaisedButton.icon(
                            label: Text("Galeriden Yükle"),
                            icon: Icon(Icons.photo),
                            onPressed: () {
                              pickImageFromGallery();
                            },
                          )))
                ],
              )
            ],
          )
        ],
      ),
    ));
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

  sharePost() {}
  uploadImageToFirebase(){
    String _uploadedFileURL;   
  }
}
