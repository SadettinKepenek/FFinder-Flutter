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

  _buildTop() {
    return Column(
      children: <Widget>[
        Card(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 12,
                width: MediaQuery.of(context).size.width,
              ),
              _buildProfilePhoto(),
              SizedBox(
                height: 12,
                width: MediaQuery.of(context).size.width,
              ),
              _buildProfileName(),
              SizedBox(
                height: 12,
                width: MediaQuery.of(context).size.width,
              ),
              Text("${profileDto.aboutMe}"),
              SizedBox(
                height: 12,
                width: MediaQuery.of(context).size.width,
              ),
            ],
          ),
        ),
        Divider(
          height: 1,
        )
      ],
    );
  }

  _buildProfilePhoto() {
    return CircleAvatar(
      backgroundImage: NetworkImage(profileDto.profilePhotoUrl),
      radius: 50,
      backgroundColor: Colors.transparent,
    );
  }

  _buildProfileName() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Column(
          children: <Widget>[
            Text(
                "${profileDto.firstname} ${profileDto.lastname.toUpperCase()}"),
          ],
        ),
        SizedBox(height: 0.1,width: 5,),
        Column(
          children: <Widget>[
            IconButton(icon: Icon(Icons.group_add),onPressed: (){},)
          ],
        )
      ],
    );
  }

  _mainPageWidgetCompleted() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[_buildTop()],
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
