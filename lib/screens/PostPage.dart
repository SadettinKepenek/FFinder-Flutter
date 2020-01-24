import 'package:ffinder/models/Post_DataTransferObjects/PostDetailDto.dart';
import 'package:ffinder/services/ApiService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PostPageState();
}

class PostPageState extends State<PostPage> {
  List<PostDetailDto> posts;
  Widget _postPageWidget;

  Widget get postPageWidget {
    if (posts == null) {
      return _postPageWidgetLoading();
    }
    return _postPageWidgetCompleted();
  }

  set postPageWidget(Widget widget) {
    if (!mounted) return;
    setState(() {
      _postPageWidget = widget;
    });
  }

  getPosts() async {
    var response = await ApiService.userPostsRequest();
    posts = response;
    postPageWidget = _postPageWidgetCompleted();
  }

  @override
  void initState() {
    super.initState();
    getPosts();
  }

  _postPageWidgetCompleted() {
    return Scaffold(body: Container(child: Text(posts.first.postId)));
  }

  _postPageWidgetLoading() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[LinearProgressIndicator()],
    );
  }

  @override
  Widget build(BuildContext context) {
    return postPageWidget;
  }
}
