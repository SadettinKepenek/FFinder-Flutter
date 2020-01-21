import 'package:ffinder/models/User_DataTransferObjects/UserDetailDto.dart';
import 'package:ffinder/services/ApiService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key key}) : super(key: key) {}

  @override
  State<StatefulWidget> createState() {
    return new ProfilePageState();
  }
}

class ProfilePageState extends State<ProfilePage> {
  UserDetailDto profileDto;
  Widget _mainPageWidget;

  Widget get mainPageWidget {
    if (profileDto == null) {
      return _mainPageWidgetLoading();
    }
    return _mainPageWidgetCompleted();
  }

  set mainPageWidget(Widget widget) {
    if (!mounted) return;
    setState(() {
      _mainPageWidget = widget;
    });
  }

  _loadProfile() async {
    var response = await ApiService.getMyProfile();
    profileDto = response;
    mainPageWidget = _mainPageWidgetCompleted();
  }

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  @override
  Widget build(BuildContext context) {
    return mainPageWidget;
  }

  _mainPageWidgetCompleted() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text("Profile Page of ${profileDto.userName}"),
          )
        ],
      ),
    );
  }

  _mainPageWidgetLoading() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[LinearProgressIndicator()],
    );
  }
}
