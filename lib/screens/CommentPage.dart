import 'package:ffinder/models/CommentRate_DataTransferObjects/CommentRateAddDto.dart';
import 'package:ffinder/models/CommentRate_DataTransferObjects/CommentRateDetailDto.dart';
import 'package:ffinder/models/CommentRate_DataTransferObjects/CommentRateListDto.dart';
import 'package:ffinder/models/Comment_DataTransferObjects/CommentAddDto.dart';
import 'package:ffinder/models/Comment_DataTransferObjects/CommentListDto.dart';
import 'package:ffinder/models/Comment_DataTransferObjects/CommentListDto.dart';
import 'package:ffinder/models/Post_DataTransferObjects/PostDetailDto.dart';
import 'package:ffinder/models/ResponseModels/HttpResponseModelData.dart';
import 'package:ffinder/models/User_DataTransferObjects/UserDetailDto.dart';
import 'package:ffinder/models/User_DataTransferObjects/UserLoginResponseDto.dart';
import 'package:ffinder/services/ApiService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:timeago/timeago.dart' as timeago;

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
  var likeColors = Map<String, Color>();
  Widget _mainPageWidget;
  final globalKey = GlobalKey<ScaffoldState>();

  PostDetailDto postDetailDto;
  UserLoginResponseDto loginResponseDto;
  UserDetailDto myProfile;

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

    var postDetail = HttpResponseModelData<PostDetailDto>();
    if (response.runtimeType == postDetail.runtimeType) {
      HttpResponseModelData<PostDetailDto> dto = response;
      this.postDetailDto = dto.data;
      this
          .postDetailDto
          .comments
          .sort((a, b) => b.commentDate.compareTo(a.commentDate));
      loginResponseDto = await StorageService.getAuth();
      myProfile=await StorageService.getMyProfile();
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

  String commentString;
  TextEditingController commentTextController = new TextEditingController();
  Widget _completedWidget() {
    var container = Container(
      child: Column(
        children: <Widget>[
          Expanded(
            child: _buildCommentWidget(),
          ),
          SizedBox(
            height: 70,
            width: MediaQuery.of(context).size.width,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Center(
                    child: TextField(
                      controller: commentTextController,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      scrollPhysics: ScrollPhysics(),
                      maxLength: 150,
                      maxLengthEnforced: true,
                      autocorrect: true,
                      keyboardAppearance: Brightness.dark,
                      style: TextStyle(fontSize: 16),
                      decoration: InputDecoration.collapsed(
                          hintStyle: TextStyle(
                              fontSize: 16, fontStyle: FontStyle.italic),
                          hintText: "Yaratıcı bir şeyler yaz..."),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    _addCommentRequest();
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
    return container;
  }

  _addCommentRequest() async {
    CommentAddDto commentAddDto = new CommentAddDto();
    commentAddDto.commentBody = commentTextController.text;
    commentAddDto.commentDate = DateTime.now();
    commentAddDto.isActive = true;
    commentAddDto.ownerId = loginResponseDto.id;
    commentAddDto.postId = postDetailDto.postId;

    var response = await ApiService.addComment(commentAddDto);
    if (response.statusCode == 200) {
      FocusScope.of(context).unfocus();
      commentTextController.clear();
      CommentListDto commentListDto = CommentListDto();
      commentListDto.commentBody = commentTextController.text;
      commentListDto.commentDate = DateTime.now();
      commentListDto.isActive = true;
      commentListDto.ownerId = loginResponseDto.id;
      commentListDto.postId = postDetailDto.postId;
      commentListDto.ownerEmail=myProfile.email;
      commentListDto.ownerProfilePhoto=myProfile.profilePhotoUrl;
      commentListDto.ownerFirstname=myProfile.firstname;
      commentListDto.ownerLastname=myProfile.lastname;

      postDetailDto.comments.add(commentListDto);
      _addNewComment(commentListDto);
      // globalKey.currentState.showSnackBar(SnackBar(
      //   behavior: SnackBarBehavior.floating,
      //   elevation: 6.0,
      //   content: Text("Yorum başarıyla eklendi"),
      // ));
    } else {
      // globalKey.currentState.showSnackBar(SnackBar(
      //   behavior: SnackBarBehavior.floating,
      //   elevation: 6.0,
      //   content: Text("Yorum eklenirken hata oluştu"),
      // ));
    }
  }

  List<Widget> commentWidgets = List<Widget>();
  Widget _addNewComment(CommentListDto comment) {
    var child = Card(
        child: Column(
      children: <Widget>[
        ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(comment.ownerProfilePhoto),
              radius: 25,
            ),
            subtitle: GestureDetector(
                child: RichText(
                  maxLines: 11,
                  text: TextSpan(children: [
                    TextSpan(
                      text: comment.ownerUserName,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    TextSpan(
                        text: "\t\t${timeago.format(comment.commentDate)}",
                        style: TextStyle(color: Colors.blueGrey)),
                    TextSpan(
                      text: "\n",
                    ),
                    TextSpan(
                      text: comment.commentBody.trim(),
                      style: TextStyle(color: Colors.black),
                    )
                  ]),
                ),
                onDoubleTap: () {})),
        Row(
          children: <Widget>[
            SizedBox(
              height: .1,
              width: 70,
            ),
          ],
        )
      ],
    ));
    setState(() {
      commentWidgets.add(child);
    });
  }
  Widget _buildCommentWidget() {
    if (postDetailDto.comments == null || postDetailDto.comments.length == 0) {
      var child = Column(
        children: <Widget>[
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 125,
          ),
          Text("Herhangi bir yorum yok.")
        ],
      );
      commentWidgets.add(child);
    } else {
      for (var comment in postDetailDto.comments) {
        print(comment.rates.length);
        _addNewComment(comment);
      }
    }

    return ListView(children: commentWidgets);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      child: Scaffold(
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
