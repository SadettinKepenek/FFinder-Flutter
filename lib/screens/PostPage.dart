import 'package:cached_network_image/cached_network_image.dart';
import 'package:ffinder/models/PostRate_DataTransferObjects/PostRateAddDto.dart';
import 'package:ffinder/models/PostRate_DataTransferObjects/PostRateListDto.dart';
import 'package:ffinder/models/Post_DataTransferObjects/PostListDto.dart';
import 'package:ffinder/services/ApiService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'CommentPage.dart';

class PostPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PostPageState();
}

class PostPageState extends State<PostPage> {
  List<PostListDto> posts;
  Widget _postPageWidget;
  var likeColors = Map<String, Color>();
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
    posts.sort((a, b) => b.publishDate.compareTo(a.publishDate));
    postPageWidget = _postPageWidgetCompleted();
  }

  @override
  void initState() {
    super.initState();
    getPosts();
  }

  _postPageWidgetCompleted() {
    return Scaffold(
        body: Container(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[_buildPosts()],
    )));
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

  _buildPosts() {
    var grid = GridView.count(
        crossAxisCount: 1,
        physics: ScrollPhysics(),
        shrinkWrap: true,
        childAspectRatio: (MediaQuery.of(context).size.width / 480),
        padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
        children: _buildPostGridItems());

    return Expanded(
      child: grid,
    );
  }

  List<Widget> _buildPostGridItems() {
    assert(posts != null);
    var items = List<Widget>();
    try {
      for (var post in posts) {
        var column = Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buildPostImageTop(post),
            _buildPostBody(post),
            _buildPostActionButtons(post),
            _buildPostLikes(post),
            _buildPostInfo(post),
            Divider(
              color: Theme.of(context).primaryColor,
              thickness: 0.35,
            ),
          ],
        );

        items.add(column);
      }
    } catch (e) {}
    return items;
  }

  _buildPostImageTop(PostListDto post) {
    return Padding(
      padding: EdgeInsets.fromLTRB(5, 0, 8, 5),
      child: Row(
        children: <Widget>[
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: NetworkImage(post.ownerProfilePhoto),
                    radius: 15,
                    backgroundColor: Colors.transparent,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "${post.ownerUserName}",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  _buildPostBody(post) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: .5),
      child: GestureDetector(
          onDoubleTap: () {
            _like(post);
          },
          child: _buildPostImage(post)),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(width: .5, color: Colors.blueGrey),
              top: BorderSide(width: .5, color: Colors.blueGrey),
              left: BorderSide(width: .5, color: Colors.blueGrey),
              right: BorderSide(width: .5, color: Colors.blueGrey)),
          shape: BoxShape.rectangle),
    );
  }

  _buildPostImage(post) {
    var img = CachedNetworkImage(
      errorWidget: (context, url, error) => _buildPostImageErrorWidget(),
      imageUrl: post.postImageUrl,
      height: 280,
      width: MediaQuery.of(context).size.width,
      fit: BoxFit.fill,
      placeholder: (context, url) => _buildPostImagePlaceholder(),
    );
    return img;
  }

  _buildPostImagePlaceholder() {
    return SizedBox(
      height: 280,
      width: MediaQuery.of(context).size.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: CircularProgressIndicator(),
          )
        ],
      ),
    );
  }

  _buildPostImageErrorWidget() {
    return SizedBox(
      height: 280,
      width: MediaQuery.of(context).size.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.error,
                  size: 32,
                ),
                Text("Resim yüklenilemedi lütfen daha sonra tekrar deneyiniz.")
              ],
            ),
          )
        ],
      ),
    );
  }

  _buildPostActionButtons(PostListDto dto) {
    var likeColor = _isLiked(dto) ? Colors.green : Colors.blueGrey;
    var dislikeColor = _isDisliked(dto) ? Colors.red : Colors.blueGrey;
    likeColors.putIfAbsent("LikeButton_${dto.postId}", () => likeColor);
    likeColors.putIfAbsent("DislikeButton_${dto.postId}", () => dislikeColor);

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.mood),
          iconSize: 24,
          color: likeColors["LikeButton_${dto.postId}"],
          onPressed: () {
            _like(dto);
          },
        ),
        IconButton(
          icon: Icon(Icons.mood_bad),
          onPressed: () {
            _dislike(dto);
          },
          iconSize: 24,
          color: likeColors["DislikeButton_${dto.postId}"],
        ),
        IconButton(
          icon: Icon(Icons.comment),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CommentPage(
                  postId: dto.postId,
                ),
                fullscreenDialog: true,
              ),
            );
          },
          iconSize: 24,
        ),
        IconButton(
          icon: Icon(Icons.share),
          onPressed: () {},
          iconSize: 24,
        ),
      ],
    );
  }

  _buildPostLikes(PostListDto post) {
    return Padding(
      child: Row(
        children: <Widget>[
          Text(
            "${this.posts.firstWhere((p) => p.postId == post.postId).rates.where((data) => data.isLike).toList().length} Likes",
            style: TextStyle(
                fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 0.1,
            width: 5,
          ),
          Text(
            "${this.posts.firstWhere((p) => p.postId == post.postId).rates.where((data) => data.isLike == false).toList().length} Dislikes",
            style: TextStyle(
                fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      padding: EdgeInsets.fromLTRB(10, 0, 10, 2),
    );
  }

  _buildPostInfo(PostListDto post) {
    return Align(
      child: Padding(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            RichText(
              maxLines: 3,
              text: TextSpan(children: [
                TextSpan(
                  text: post.ownerUserName,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
                TextSpan(text: " "),
                TextSpan(
                  text: post.postBody,
                  style: DefaultTextStyle.of(context).style,
                )
              ]),
            ),
            SizedBox(
              height: .5,
            ),
            Text(
              timeago.format(post.publishDate),
              maxLines: 1,
              style: TextStyle(
                  fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      ),
      alignment: Alignment.bottomLeft,
    );
  }

  void _like(PostListDto dto) {
    _switchRate(dto, true);
    var currentColor = likeColors["LikeButton_${dto.postId}"];

    if (currentColor == Colors.green) {
      // remove request
      _removeRate(dto);
      setState(() {
        likeColors["LikeButton_${dto.postId}"] = Colors.blueGrey;
      });
    } else {
      _rateRequest(true, dto.postId, dto.ownerId);
      setState(() {
        likeColors["LikeButton_${dto.postId}"] = Colors.green;
      });
    }
  }

  void _dislike(PostListDto dto) {
    var currentColor = likeColors["DislikeButton_${dto.postId}"];

    _switchRate(dto, false);

    if (currentColor == Colors.red) {
      // remove request
      _removeRate(dto);
      setState(() {
        likeColors["DislikeButton_${dto.postId}"] = Colors.blueGrey;
      });
    } else {
      _rateRequest(false, dto.postId, dto.ownerId);
      setState(() {
        likeColors["DislikeButton_${dto.postId}"] = Colors.red;
      });
    }
  }

  void _removeRate(PostListDto dto) {
    ApiService.deleteRate(dto.postId, dto.ownerId);
    var willDeleted = this
        .posts
        .firstWhere((p) => p.postId == dto.postId)
        .rates
        .firstWhere(
            (rate) => rate.ownerId == dto.ownerId && rate.postId == dto.postId);
    this
        .posts
        .firstWhere((p) => p.postId == dto.postId)
        .rates
        .remove(willDeleted);
  }

  void _switchRate(PostListDto dto, bool isLike) {
    if (isLike) {
      var dislikeColor = likeColors["DislikeButton_${dto.postId}"];
      if (dislikeColor == Colors.red) {
        _removeRate(dto);
      }
      setState(() {
        likeColors["DislikeButton_${dto.postId}"] = Colors.blueGrey;
      });
    } else {
      var likeColor = likeColors["LikeButton_${dto.postId}"];
      if (likeColor == Colors.green) {
        _removeRate(dto);
      }
      setState(() {
        likeColors["LikeButton_${dto.postId}"] = Colors.blueGrey;
      });
    }
  }

  _rateRequest(bool isLike, String postId, String ownerId) {
    PostRateAddDto postRateAddDto = new PostRateAddDto();
    postRateAddDto.isActive = true;
    postRateAddDto.isLike = isLike;
    postRateAddDto.ownerId = ownerId;
    postRateAddDto.postId = postId;
    postRateAddDto.rateDate = DateTime.now();

    var dto = new PostRateListDto();
    dto.isActive = true;
    dto.isLike = isLike;
    dto.ownerId = ownerId;
    dto.postId = postId;
    dto.rateDate = DateTime.now();
    this.posts.firstWhere((p) => p.postId == postId).rates.add(dto);

    ApiService.addRate(postRateAddDto);
  }

  bool _isLiked(PostListDto dto) {
    var isLike =
        dto.rates.any((rate) => rate.ownerId == dto.ownerId && rate.isLike);
    return isLike;
  }

  bool _isDisliked(PostListDto dto) {
    var isLike =
        dto.rates.any((rate) => rate.ownerId == dto.ownerId && !rate.isLike);
    return isLike;
  }
}
