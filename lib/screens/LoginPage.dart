import 'package:ffinder/mixins/LoginMixins/LoginValidator_mixin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> with LoginValidator {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(25.0),
        child: Center(
      child: Form(
        key: formKey,

        child: Column(
          children: <Widget>[
            userNameTextField(),
            passwordTextField(),
            submitButton()
          ],
        ),
      ),
    ));
  }

  userNameTextField() {
    return TextFormField(

      decoration: InputDecoration(
          labelText: "Username", hintText: "Kullanıcı Adını Girin"),
          validator: usernameValidator,
    );
  }
  passwordTextField() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: "Password", hintText: "Şifreyi Girin"),
          validator: passwordValidator,

    );
  }
  submitButton() {
    return RaisedButton(
      child: Text("Giriş"),

      onPressed: (){
        if(formKey.currentState.validate()){
           formKey.currentState.save();
          
        }
      },

    );
  }

}
