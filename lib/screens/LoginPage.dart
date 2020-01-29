import 'package:ffinder/mixins/LoginMixins/LoginValidator_mixin.dart';
import 'package:ffinder/models/User_DataTransferObjects/UserLoginRequestDto.dart';
import 'package:ffinder/models/User_DataTransferObjects/UserLoginResponseDto.dart';
import 'package:ffinder/screens/MainPage.dart';
import 'package:ffinder/screens/RegisterPage.dart';
import 'package:ffinder/services/ApiService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> with LoginValidator {
  final formKey = GlobalKey<FormState>();
  UserLoginRequestDto loginRequestDto = new UserLoginRequestDto();
  @override
  Widget build(BuildContext context) {
    return _buildPage();
  }

  _buildPage() {
    return Center(
        child: Container(
            margin: EdgeInsets.all(25.0),
            child: Center(
              child: Form(
                autovalidate: true,
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    userNameTextField(),
                    passwordTextField(),
                    submitButton()
                  ],
                ),
              ),
            )));
  }

  userNameTextField() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: "Username",
          icon: Icon(Icons.person),
          hintText: "Kullanıcı Adını Girin"),
      validator: usernameValidator,
      onSaved: (String val) => {loginRequestDto.username = val},
    );
  }

  passwordTextField() {
    return TextFormField(
        decoration: InputDecoration(
            labelText: "Password",
            icon: Icon(Icons.vpn_key),
            hintText: "Şifreyi Girin"),
        validator: passwordValidator,
        obscureText: true,
        onSaved: (String val) => {loginRequestDto.password = val});
  }

  submitButton() {
    return Row(
      children: <Widget>[
                SizedBox(
          width: 60,
        ),
        RaisedButton(
          child: Text(
            "Giriş",
          ),
          onPressed: () async {
            if (formKey.currentState.validate()) {
              formKey.currentState.save();

              var response = await ApiService.loginRequest(loginRequestDto);
              if (response is UserLoginResponseDto) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MainPage()),
                );
              } else {
                _snackBar();
              }
            }
          },
        ),
        SizedBox(
          width: 60,
        ),
        RaisedButton(
          child: Text("Kayıt Ol"),
          onPressed: () async {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => RegisterPage()),
            );
          },
        )
      ],
    );
  }

  void _snackBar() {
    Scaffold.of(context).showSnackBar(SnackBar(
      behavior: SnackBarBehavior.floating,
      elevation: 6.0,
      content: Text(
          "Kullanıcı girişi yapılırken hata.Lütfen bilgilerinizi kontrol ediniz"),
      action: SnackBarAction(
          label: "Tekrar Dene",
          onPressed: () {
            // Nothing
          }),
    ));
  }
}
