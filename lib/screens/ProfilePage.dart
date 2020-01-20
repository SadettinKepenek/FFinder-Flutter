import 'package:flutter/cupertino.dart';

class ProfilePage extends StatefulWidget {

  ProfilePage({Key key,@required String userId}):super(key:key);


  @override
  State<StatefulWidget> createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _buildContainer();
  }

  _buildContainer() {
    return Container(
      child: Column(
        children: <Widget>[

        ],
      ),
    );
  }
}
