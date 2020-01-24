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
  final globalKey = GlobalKey<ScaffoldState>();

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
    var response = await ApiService.getPost(postId: this.widget.postId);

    if (response.runtimeType == HttpResponseModelData) {
      HttpResponseModelData<PostDetailDto> dto = response;
      this.postDetailDto = dto.data;
      this
          .postDetailDto
          .comments
          .sort((a, b) => b.commentDate.compareTo(a.commentDate));
      loginResponseDto = await StorageService.getAuth();
      mainPageWidget = _completedWidget();
    } else {
      _snackBar();
    }
  }

  void _snackBar() {
    globalKey.currentState.showSnackBar(SnackBar(
      behavior: SnackBarBehavior.floating,
      elevation: 6.0,
      content: Text(
          "Veri çekilirken hata oluştu lütfen daha sonra tekrar deneyiniz."),
      action: SnackBarAction(
          label: "Kapat",
          onPressed: () {
            Navigator.pop(context);
            // Nothing
          }),
    ));
  }

  Widget _loadingWidget() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[CircularProgressIndicator()],
      ),
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
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blueGrey,
          buttonColor: Colors.white,
          buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary)),
      home: Scaffold(
          key: globalKey,
          body: mainPageWidget,
          appBar: AppBar(
            title: Text("FFinder"),
          )),
    );
  }

  @override
  void initState() {
    super.initState();
    _loadPost();
  }
}

