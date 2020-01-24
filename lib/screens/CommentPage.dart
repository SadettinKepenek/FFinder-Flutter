import 'package:ffinder/models/CommentRate_DataTransferObjects/CommentRateAddDto.dart';
import 'package:ffinder/models/CommentRate_DataTransferObjects/CommentRateDetailDto.dart';
import 'package:ffinder/models/Comment_DataTransferObjects/CommentListDto.dart';
import 'package:ffinder/models/Comment_DataTransferObjects/CommentListDto.dart';
import 'package:ffinder/models/Post_DataTransferObjects/PostDetailDto.dart';
import 'package:ffinder/models/ResponseModels/HttpResponseModelData.dart';
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
      mainPageWidget = _completedWidget();
    } else {
      _snackBar();
    }
  }

  bool _isLiked(CommentListDto dto) {
    var isLike = dto.rates
        .any((rate) => rate.ownerId == loginResponseDto.id && rate.isLike);
    return isLike;
  }

  bool _isDisliked(CommentListDto dto) {
    var isLike = dto.rates
        .any((rate) => rate.ownerId == loginResponseDto.id && !rate.isLike);
    return isLike;
  }

  void _switchRate(CommentListDto dto, bool isLike) {
    if (isLike) {
      var dislikeColor = likeColors["DislikeButton_${dto.commentId}"];
      if (dislikeColor == Colors.red) {
        _removeRate(dto);
      }
      setState(() {
        likeColors["DislikeButton_${dto.commentId}"] = Colors.blueGrey;
      });
    } else {
      var likeColor = likeColors["LikeButton_${dto.commentId}"];
      if (likeColor == Colors.green) {
        _removeRate(dto);
      }
      setState(() {
        likeColors["LikeButton_${dto.commentId}"] = Colors.blueGrey;
      });
    }
  }

  void _like(CommentListDto dto) {
    _switchRate(dto, true);
    var currentColor = likeColors["LikeButton_${dto.commentId}"];

    if (currentColor == Colors.green) {
      // remove request
      _removeRate(dto);
      setState(() {
        likeColors["LikeButton_${dto.commentId}"] = Colors.blueGrey;
      });
    } else {
      _rateRequest(true, dto.commentId);
      setState(() {
        likeColors["LikeButton_${dto.commentId}"] = Colors.green;
      });
    }
  }

  void _dislike(CommentListDto dto) {
    var currentColor = likeColors["DislikeButton_${dto.commentId}"];

    _switchRate(dto, false);

    if (currentColor == Colors.red) {
      // remove request
      _removeRate(dto);
      setState(() {
        likeColors["DislikeButton_${dto.commentId}"] = Colors.blueGrey;
      });
    } else {
      _rateRequest(false, dto.commentId);
      setState(() {
        likeColors["DislikeButton_${dto.commentId}"] = Colors.red;
      });
    }
  }

  void _removeRate(CommentListDto dto) {
    ApiService.deleteCommentRate(dto.commentId, loginResponseDto.id);
    var willDeleted = this
        .postDetailDto
        .comments
        .firstWhere((p) => p.commentId == dto.commentId)
        .rates
        .firstWhere((rate) =>
            rate.ownerId == loginResponseDto.id &&
            rate.commentId == dto.commentId);
    this
        .postDetailDto
        .comments
        .firstWhere((p) => p.commentId == dto.commentId)
        .rates
        .remove(willDeleted);
  }

  _rateRequest(bool isLike, String commentId) {
    CommentRateAddDto commentRateAddDto = new CommentRateAddDto();
    commentRateAddDto.isActive = true;
    commentRateAddDto.isLike = isLike;
    commentRateAddDto.ownerId = loginResponseDto.id;
    commentRateAddDto.commentId = commentId;
    commentRateAddDto.rateDate = DateTime.now();

    var dto = new CommentRateDetailDto();
    dto.isActive = true;
    dto.isLike = isLike;
    dto.ownerId = loginResponseDto.id;
    dto.commentId = commentId;
    dto.rateDate = DateTime.now();
    this
        .postDetailDto
        .comments
        .firstWhere((p) => p.commentId == commentId)
        .rates
        .add(dto);

    ApiService.addCommentRate(commentRateAddDto);
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
    var container = Container(
      child: Column(
        children: <Widget>[
          Expanded(
            child: _buildCommentWidget(),
          )
        ],
      ),
    );
    return container;
  }

  Widget _buildCommentWidget() {
    var childs = List<Widget>();
    for (var comment in postDetailDto.comments) {
      var likeColor = _isLiked(comment) ? Colors.green : Colors.blueGrey;
      var dislikeColor = _isDisliked(comment) ? Colors.red : Colors.blueGrey;
      likeColors.putIfAbsent(
          "LikeButton_${comment.commentId}", () => likeColor);
      likeColors.putIfAbsent(
          "DislikeButton_${comment.commentId}", () => dislikeColor);

      print(comment.rates.length);
      var child = Card(
          child: Column(
        children: <Widget>[
          ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(comment.owner.profilePhotoUrl),
                radius: 25,
              ),
              subtitle: GestureDetector(
                  child: RichText(
                    maxLines: 11,
                    text: TextSpan(children: [
                      TextSpan(
                        text: comment.owner.userName,
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
                  onDoubleTap: () {
                    _like(comment);
                  })),
          Row(
            children: <Widget>[
              SizedBox(
                height: .1,
                width: 70,
              ),
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.mood),
                    iconSize: 24,
                    onPressed: () {
                      _like(comment);
                    },
                    color: likeColors["LikeButton_${comment.commentId}"],
                  ),
                  Text(
                    "${comment.rates.where((rate) => rate.isLike).toList().length}",
                    style: TextStyle(
                        color: Colors.black, fontStyle: FontStyle.italic),
                  ),
                  IconButton(
                    icon: Icon(Icons.mood_bad),
                    iconSize: 24,
                    onPressed: () {
                      _dislike(comment);
                    },
                    color: likeColors["DislikeButton_${comment.commentId}"],
                  ),
                  Text(
                    "${comment.rates.where((rate) => !rate.isLike).toList().length}",
                    style: TextStyle(
                        color: Colors.black, fontStyle: FontStyle.italic),
                  ),
                ],
              )
            ],
          )
        ],
      ));
      childs.add(child);
    }
    return ListView(children: childs);
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
