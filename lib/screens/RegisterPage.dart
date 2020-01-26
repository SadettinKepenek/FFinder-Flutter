import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => RegisterPageState();

}
class RegisterPageState extends State<RegisterPage>{
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(title:Text("Kayıt"),),
        body: _builderStep(),
      ),
    );
  }
  Widget _builderStep() => Container(
        margin: EdgeInsets.only(top: 10),
        child: Stepper(
          steps: [
            Step(
              title: Text("First"),
              content: Text("This is our first example."),
            ),
            Step(
              title: Text("Second"),
              content: Text("This is our second example."),
            ),
            Step(
              title: Text("Third"),
              content: Text("This is our third example."),
            ),
            Step(
              title: Text("Forth"),
              content: Text("This is our forth example."),
            ),
          ],
          currentStep: _index,
          onStepTapped: (index) {
            setState(() {
              _index = index;
            });
          },
          controlsBuilder: (BuildContext context,
                  {VoidCallback onStepContinue, VoidCallback onStepCancel}) =>
              Container(),
        ),
      );
}