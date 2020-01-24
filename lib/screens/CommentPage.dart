import 'package:ffinder/models/Post_DataTransferObjects/PostDetailDto.dart';
import 'package:ffinder/models/ResponseModels/HttpResponseModelData.dart';
import 'package:ffinder/models/User_DataTransferObjects/UserLoginResponseDto.dart';
import 'package:ffinder/services/ApiService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommentPage extends StatefulWidget {
  String postId;
  @override
  State<StatefulWidget> createState() {
    return CommentPageState();
  }

  CommentPage({@required String postId}) {
    this.postId = postId;
  }
}

class CommentPageState extends State<CommentPage> {
  Widget _mainPageWidget;

  PostDetailDto postDetailDto;
  UserLoginResponseDto loginResponseDto;

  Widget get mainPageWidget {
    if (postDetailDto == null)
      return _loadingWidget();
    else
      return _completedWidget();
  }

  set mainPageWidget(Widget widget) {
    if (!mounted) return;
    setState(() {
      _mainPageWidget = widget;
    });
  }

  _loadPost() async {
    HttpResponseModelData response =
        await ApiService.getPost(postId: this.widget.postId);
    this.postDetailDto = response.data;
    this
        .postDetailDto
        .comments
        .sort((a, b) => b.commentDate.compareTo(a.commentDate));
    loginResponseDto = await StorageService.getAuth();
    mainPageWidget = _completedWidget();
  }

  Widget _loadingWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[CircularProgressIndicator()],
    );
  }

  Widget _completedWidget() {
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
    return mainPageWidget;
  }

  @override
  void initState() {
    super.initState();
    _loadPost();
  }
}
