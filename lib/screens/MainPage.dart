import 'package:ffinder/screens/ProfilePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  MainPageState() {
    _currentWidget = _children[_currentIndex];
  }
  Widget _currentWidget;
  int _currentIndex = 0;

  final _children = <int, Widget>{
    0: Container(child: Text("Deneme1")),
    1: ProfilePage()
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blueGrey,
          buttonColor: Colors.white,
          buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary)),
      home: Scaffold(
          floatingActionButton: _buildFloatingActionButton(),
          bottomNavigationBar: _buildBottomNavigaton(),
          body: _currentWidget,
          appBar: AppBar(
            title: Text("FFinder"),
          )),
    );
  }

  _buildFloatingActionButton() {
    return FloatingActionButton(onPressed: () {}, child: Icon(Icons.edit));
  }

  void _onTapHandle(int index) {
    setState(() {
      _currentIndex = index;
      _currentWidget = _children[index];
      print(index);
    });
  }

  _buildBottomNavigaton() {
    return BottomNavigationBar(
      onTap: _onTapHandle,
      currentIndex: _currentIndex, // this will be set when a new tab is tapped
      items: [
        BottomNavigationBarItem(
          icon: new Icon(Icons.home),
          title: new Text('Anasayfa'),
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.person), title: Text('Profile'))
      ],
    );
  }
}
