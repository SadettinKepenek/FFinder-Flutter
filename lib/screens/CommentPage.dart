import 'package:ffinder/models/Post_DataTransferObjects/PostDetailDto.dart';
import 'package:ffinder/services/ApiService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommentPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CommentPageState();
  }
}

class CommentPageState extends State<CommentPage> {

  Widget _mainPageWidget;

  PostDetailDto postDetailDto;

  Widget get mainPageWidget{
    if(postDetailDto==null)
      return _loadingWidget();
    else
      return _completedWidget();
  }
  set mainPageWidget(Widget widget){
    if (!mounted) return;
     setState(() {
      _mainPageWidget = widget;
    });
  }

  _loadPost() async{
     var response = await ApiService.getMyProfile();
      
    mainPageWidget = _completedWidget();
  }

  Widget _loadingWidget(){
        return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[CircularProgressIndicator()],
    );
  }

  Widget _completedWidget(){
    var container = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[Text("Deneme")],
    );
    return container;
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }

  _loadPost() async{

  }

  @override
  void initState() {
    super.initState();

  }
}
