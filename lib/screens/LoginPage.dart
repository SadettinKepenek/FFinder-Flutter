import 'package:ffinder/mixins/LoginMixins/LoginValidator_mixin.dart';
import 'package:ffinder/models/User_DataTransferObjects/UserLoginRequestDto.dart';
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
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        RaisedButton(
          child: Text(
            "Giriş",
          ),
          onPressed: () {
            if (formKey.currentState.validate()) {
              formKey.currentState.save();

              ApiService.loginRequest(loginRequestDto);
            }
          },
        )
      ],
    );
  }
}
