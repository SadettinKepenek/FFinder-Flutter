import 'dart:io';

import 'package:ffinder/mixins/RegisterMixins/RegisterValidator_mixin.dart';
import 'package:ffinder/models/User_DataTransferObjects/UserAddDto.dart';
import 'package:ffinder/screens/MainPage.dart';
import 'package:ffinder/services/ApiService.dart';
import 'package:ffinder/services/FirebaseService.dart';
import 'package:ffinder/services/ImagePickerService.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;

class RegisterPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> with RegisterValidator {
  int _currentIndex = 0;
  final _formKey = GlobalKey<FormState>();
  File _image;
  UserAddDto userAddDto = new UserAddDto();
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
          appBar: AppBar(
            title: Text("Kayıt"),
            actions: <Widget>[
              FlatButton(
                child: Text("Kayıt Ol"),
                textColor: Colors.white,
                onPressed: () {
                  register();
                },
              )
            ],
          ),
          body: SingleChildScrollView(
            child: _buildContainer(),
          )),
    );
  }

  _buildContainer() {
    return Container(
      margin: EdgeInsets.all(20),
      child:Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          firstNameTextField(),
          lastNameTextField(),
          emailTextField(),
          countryTextField(),
          cityTextField(),
          userNameTextField(),
          passwordTextField(),
          SizedBox(
            height: 10,
          ),
          imageBody(),
          imageUploadButtons(),
        ],
      ),
    ));
  }

  imageBody() {
    return _image == null
        ? Text('Lütfen bir resim yükleyin.')
        : Image.file(
            _image,
            width: 350,
            height: 280,
          );
  }

  imageUploadButtons() {
    return Row(
      children: <Widget>[
        RaisedButton.icon(
          label: Text("Kameradan Yükle"),
          icon: Icon(Icons.camera_alt),
          onPressed: () {
            pickImageFromCamera();
          },
        ),
        SizedBox(
            width: 38,
          ),
        RaisedButton.icon(
          label: Text("Galeriden Yükle"),
          icon: Icon(Icons.photo),
          onPressed: () {
            pickImageFromGallery();
          },
        )
      ],
    );
  }

  firstNameTextField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Ad", hintText: "Adınızı Girin"),
      validator: usernameValidator,
      onSaved: (String val) => {userAddDto.firstname = val},
    );
  }

  lastNameTextField() {
    return TextFormField(
      decoration:
          InputDecoration(labelText: "Soyad", hintText: "Soyadınızı Girin"),
      validator: lastNameValidator,
      onSaved: (String val) => {userAddDto.lastname = val},
    );
  }

  emailTextField() {
    return TextFormField(
      decoration:
          InputDecoration(labelText: "E-mail", hintText: "E-mailinizi Girin"),
      validator: lastNameValidator,
      onSaved: (String val) => {userAddDto.email = val},
    );
  }

  countryTextField() {
    return TextFormField(
      decoration:
          InputDecoration(labelText: "Ülke", hintText: "Ülkenizi Girin"),
      validator: countryValidator,
      onSaved: (String val) => {userAddDto.country = val},
    );
  }

  cityTextField() {
    return TextFormField(
      decoration:
          InputDecoration(labelText: "Şehir", hintText: "Şehrinizi Girin"),
      validator: cityValidator,
      onSaved: (String val) => {userAddDto.city = val},
    );
  }

  userNameTextField() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: "Kullanıcı Adı", hintText: "Kullanıcı Adını Girin"),
      validator: usernameValidator,
      onSaved: (String val) => {userAddDto.userName = val},
    );
  }

  passwordTextField() {
    return TextFormField(
        decoration:
            InputDecoration(labelText: "Şifre", hintText: "Şifreyi Girin"),
        validator: passwordValidator,
        obscureText: true,
        onSaved: (String val) => {userAddDto.password = val});
  }

  register() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      userAddDto.aboutMe = "About Me";
      userAddDto.gender = "Not Choosen";
      userAddDto.phoneNumber = "+90 ...";
      userAddDto.isActive = true;
      userAddDto.school = "Fill The School";
      userAddDto.town = "Fill the town";
      uploadImageToFirebase(_image);
      var response = await ApiService.register(userAddDto);
      print(response.statusCode);
      if (response.statusCode == 200) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MainPage()),
        );
      } else {
        print("Hata");
      }
    }
  }

  uploadImageToFirebase(File image) async {
    String _uploadedFileURL;
    String imageName =
        "${DateTime.now().millisecondsSinceEpoch.toString() + path.basename(_image.path)}";
    _uploadedFileURL = await FirebaseService.uploadFile(_image, imageName,
        "${DateTime.now().millisecondsSinceEpoch.toString() + userAddDto.userName}");
    if (_uploadedFileURL != null) {
      userAddDto.profilePhotoUrl = _uploadedFileURL;
    }
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

  Widget generateImageUploadButtons() {
    return Row(
      children: <Widget>[
        RaisedButton.icon(
          label: Text("Kameradan"),
          icon: Icon(Icons.camera_alt),
          onPressed: () {
            pickImageFromCamera();
          },
        ),
        SizedBox(
          width: 20,
        ),
        RaisedButton.icon(
          label: Text("Galeriden"),
          icon: Icon(Icons.photo),
          onPressed: () {
            pickImageFromGallery();
          },
        )
      ],
    );
  }

  Widget imageWidget() {
    return Row(
      children: <Widget>[
        Center(
          child: _image == null
              ? Text('Lütfen bir resim yükleyin.')
              : Image.file(
                  _image,
                  width: 300,
                  height: 280,
                ),
        )
      ],
    );
  }
}
